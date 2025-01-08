<script setup>
import { onMounted, reactive, computed } from "vue";
import ForecastingStatistic from "@/components/enrollment-forecasting/ForecastingStatistic.vue";

import axios from "axios";

const props = defineProps({
	isPreview: {
		type: Boolean,
		default: false,
	},
});

const state = reactive({
	isLoading: true,
	historicalData: [],
	selectedSchoolYear: null,
	selectedSemester: null,
	selectedStrand: null,
	isAdding: false,
});

const virtualRows = computed(() => {
	return state.historicalData.map((row) => {
		const virtualRow = { ...row };

		virtualRow.semester =
			row.semester === 1 ? "First Semester" : "Second Semester";
		virtualRow.school_year = `${row.school_year_from}-${
			row.school_year_from + 1
		}`;
		return virtualRow;
	});
});

const filteredRows = computed(() => {
	let filteredRows = virtualRows.value;

	if (state.selectedSchoolYear) {
		for (const year of state.selectedSchoolYear) {
			filteredRows = filteredRows.filter(
				(row) =>
					`${row.school_year_from}-${row.school_year_from + 1}` ===
					year
			);
		}
	}

	if (state.selectedSemester) {
		for (const semester of state.selectedSemester) {
			filteredRows = filteredRows.filter(
				(row) => row.semester === semester
			);
		}
	}

	if (state.selectedStrand) {
		for (const strand of state.selectedStrand) {
			filteredRows = filteredRows.filter((row) => row.strand === strand);
		}
	}

	return filteredRows;
});

const schoolYears = computed(() => {
	return new Set(
		state.historicalData.map(
			(item) => `${item.school_year_from}-${item.school_year_from + 1}`
		)
	);
});

const latestSchoolYear = computed(() => {
	return state.historicalData.at(-1)?.school_year_from;
});

const semesterStrings = computed(() => {
	return new Set(
		state.historicalData.map((item) =>
			item.semester === 1 ? "First Semester" : "Second Semester"
		)
	);
});

const strands = computed(() => {
	return new Set(state.historicalData.map((item) => item.strand));
});

const totalRecords = computed(() => {
	return state.historicalData.length;
});

const strandCount = computed(() => {
	return new Set(state.historicalData.map((item) => item.strand)).size;
});

const latestTotalEnrollees = computed(() => {
	// get all enrollees of latest school year
	return state.historicalData
		.filter(
			(item) =>
				item.school_year_from ===
				state.historicalData.at(-1)?.school_year_from
		)
		.reduce((total, item) => total + item.enrollees, 0);
});

const headers = [
	{ title: "School Year", align: "center", key: "school_year" },
	{ title: "Semester", align: "center", key: "semester" },
	{ title: "Strand", align: "center", key: "strand" },
	{ title: "Enrollees", align: "center", key: "enrollees" },
	{ title: "Actions", align: "center", key: "actions", sortable: false },
];

const loadHistoricalData = async () => {
	try {
		const PATH = "http://localhost:5000/history";
		const response = await axios.get(PATH);
		state.historicalData = response.data;
	} catch (error) {
		console.error("Error fetching historical data:", error);
	} finally {
		console.log(state.historicalData);
	}
};

const generateHeaders = () => {
	console.log(state.historicalData.at(0).enrolees);
};

const deleteItem = (item) => {
	const id = item.id;
	state.historicalData = state.historicalData.filter(
		(item) => item.id !== id
	);
};

const sortBy = [{ key: "school_year", order: "desc" }];

const addRecord = (e) => {
	const newId =
		state.historicalData.reduce(
			(maxId, item) => Math.max(maxId, item.id),
			0
		) + 1;

	state.historicalData.push({
		id: newId,
		school_year_from: this.$refs.inputSchoolYear.value,
		semester: this.$refs.inputSemester.value.startsWith("First") ? 1 : 2,
		strand: this.$refs.inputStrand.value,
		enrollees: this.$refs.inputEnrollees.value,
	});

	state.isAdding = false;
};

const downloadAsCSV = () => {
	const csvRows = [
		"School Year,Semester,Strand,Enrollees",
		...virtualRows.value.map((row) => {
			return `${row.school_year},${row.semester},${row.strand},${row.enrollees}`;
		}),
	];

	const csvContent = "data:text/csv;charset=utf-8," + csvRows.join("\n");

	const encodedUri = encodeURI(csvContent);
	const link = document.createElement("a");
	link.setAttribute("href", encodedUri);
	link.setAttribute("download", "enrollment-history.csv");
	document.body.appendChild(link);
	link.click();
};

onMounted(async () => {
	try {
		loadHistoricalData();
	} catch (error) {
	} finally {
		state.isLoading = false;
	}
});
</script>

<template>
	<v-container
		v-if="!state.isLoading"
		class="d-flex flex-column pb-10 container ga-5"
	>
		<v-card
			v-if="!isPreview"
			class="d-flex justify-space-between px-5 pt-5 pb-0 rounded-lg align-center elevation-3 ga-5"
		>
			<v-col
				class="mb-5"
				style="
					background-color: #7caed266;
					padding-bottom: -2rem !important;
				"
			>
				<ForecastingStatistic
					isMain="true"
					readonly="true"
					icon="mdi-account-group"
					label="Enrollees Last Year"
					:value="latestTotalEnrollees"
				></ForecastingStatistic>
			</v-col>
			<v-col
				class="mb-5"
				style="
					background-color: #d5636366;
					padding-bottom: -2rem !important;
				"
			>
				<ForecastingStatistic
					isMain="true"
					readonly="true"
					icon="mdi-bulletin-board"
					label="Number of Strands"
					:value="strandCount"
				></ForecastingStatistic>
			</v-col>
			<v-col
				class="mb-5"
				style="
					background-color: #e3d54f66;
					padding-bottom: -2rem !important;
				"
			>
				<ForecastingStatistic
					isMain="true"
					readonly="true"
					icon="mdi-file-multiple"
					label="Total Records"
					:value="totalRecords"
				></ForecastingStatistic>
			</v-col>
		</v-card>
		<v-card
			title="Enrollment History"
			class="px-10 pt-1 pb-5 rounded-lg elevation-3"
		>
			<v-row v-if="!isPreview" class="d-flex pt-5 align-center ga-5">
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="schoolYears"
					v-model="state.selectedSchoolYear"
					multiple
					density="compact"
					label="School Year"
				></v-combobox>
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="semesterStrings"
					v-model="state.selectedSemester"
					density="compact"
					multiple
					label="Semester"
				></v-combobox>
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="strands"
					v-model="state.selectedStrand"
					density="compact"
					multiple
					label="Strand"
				></v-combobox>
			</v-row>
			<v-row>
				<v-data-table-virtual
					:headers="headers"
					:items="filteredRows"
					v-model:sort-by="sortBy"
					height="40vh"
				>
					<template v-slot:item.actions="{ item }">
						<v-btn
							color="error"
							variant="tonal"
							density="comfortable"
							prepend-icon="mdi-delete-empty-outline"
							@click="deleteItem(item)"
							>Delete</v-btn
						>
					</template>
				</v-data-table-virtual>
			</v-row>
			<v-dialog v-if="!isPreview" max-width="max-content">
				<template v-slot:activator="{ props: activatorProps }">
					<v-row class="d-flex justify-end py-5 ga-5">
						<v-btn
							prepend-icon="mdi-content-save-outline"
							color="primary"
							@click="downloadAsCSV"
							>Export
						</v-btn>
						<v-btn
							prepend-icon="mdi-plus"
							color="success"
							v-bind="activatorProps"
							>Add</v-btn
						>
					</v-row>
				</template>

				<template v-slot:default="{ isActive }">
					<v-card title="Add Enrollment Record">
						<v-card-text>
							<v-form>
								<v-row class="d-flex mx-5 mt-3 ga-1">
									<v-col>
										<v-text-field
											ref="inputSchoolYear"
											type="number"
											label="Start of School Year"
											variant="outlined"
											width="200px"
											hide-spin-buttons
											required
										>
										</v-text-field>
									</v-col>
									<v-col>
										<v-combobox
											ref="inputSemester"
											auto-select-first="exact"
											variant="outlined"
											:items="semesterStrings"
											label="Semester"
											width="200px"
											required
										></v-combobox>
									</v-col>
									<v-col>
										<v-combobox
											ref="inputStrand"
											auto-select-first="exact"
											variant="outlined"
											:items="strands"
											label="Strand"
											width="200px"
											required
										></v-combobox>
									</v-col>
									<v-col>
										<v-text-field
											ref="inputEnrollees"
											type="number"
											label="Number of Enrollees"
											variant="outlined"
											width="200px"
											hide-spin-buttons
											required
										>
										</v-text-field>
									</v-col>
								</v-row>
								<v-row class="d-flex justify-end">
									<v-card-actions>
										<v-btn
											text="Add"
											color="success"
											variant="tonal"
											type="submit"
											@submit.prevent="addRecord"
										></v-btn>
										<v-btn
											text="Cancel"
											@click="isActive.value = false"
										></v-btn>
									</v-card-actions>
								</v-row>
							</v-form>
						</v-card-text>
					</v-card>
				</template>
			</v-dialog>
		</v-card>
	</v-container>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Karla:ital,wght@0,200..800;1,200..800&display=swap");
.v-card {
	font-family: "Inter", serif;
}

.v-card:deep(.v-card-title) {
	font-weight: 600;
	font-size: 32px;
}

.v-combobox {
	width: 30%;
}
</style>
