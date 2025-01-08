<script setup>
import { onMounted, reactive, computed } from "vue";

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
	selectedAlgorithm: "Moving Average",
});

const trendData = computed(() => {
	return filterByStrand(state.selectedStrand).map((item) => item.enrollees);
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
		console.log(filterByStrand("STEM"));
	} catch (error) {
		console.error("Error fetching historical data:", error);
	} finally {
		console.log(state.historicalData);
	}
};

onMounted(async () => {
	try {
		loadHistoricalData();
		state.selectedSchoolYear =
			getLatestSchoolYear() + "-" + getLatestSchoolYear() + 1;
		state.selectedSemester = "First Semester";
		state.selectedStrand = "ABM";
	} catch (error) {
	} finally {
		state.isLoading = false;
	}
});

const filterByStrand = (strand) => {
	return state.historicalData.filter((item) => item.strand === strand);
};

const filterBySemester = (semester) => {
	return state.historicalData.filter((item) => item.semester === semester);
};

const colors = ["7CAED2", "D56363", "E3D54F", "74E760", "B6A7A7", "E4DA78"];
const algorithms = ["Moving Average", "Exponential Smoothing", "SARIMA"];

const chartOptions = reactive({
	fill: true,
	padding: 8,
	smooth: true,
	value: [0, 2, 5, 9, 5, 10, 3, 5, 0, 0, 1, 8, 2, 9, 0],
	lineWidth: 2,
});
</script>

<template>
	<v-container v-if="!state.isLoading" class="pb-10 container">
		<v-card
			title="Enrollment Forecast"
			v-if="!isPreview"
			class="mb-10 px-10 pt-1 rounded-lg elevation-3 header-box round"
		>
			<v-row v-if="!isPreview" class="d-flex pt-5 align-center ga-5">
				<v-combobox
					v-model="state.selectedAlgorithm"
					auto-select-first="exact"
					variant="solo-filled"
					:items="algorithms"
				></v-combobox>
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="schoolYears"
					v-model="state.selectedSchoolYear"
					label="School Year"
				></v-combobox>
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="semesterStrings"
					v-model="state.selectedSemester"
					label="Semester"
				></v-combobox>
				<v-combobox
					auto-select-first="exact"
					variant="solo-filled"
					:items="strands"
					v-model="state.selectedStrand"
					label="Strand"
					clearable
				></v-combobox>
			</v-row>
		</v-card>

		<v-row style="height: 800px">
			<v-col>
				<v-sheet class="stackSheet" color="white">
					<v-sparkline
						v-if="!state.selectedStrand"
						v-for="strand in strands"
						:key="index"
						class="stackSpark"
						:line-width="chartOptions.lineWidth"
						:model-value="
							filterByStrand(strand).map((item) => item.enrollees)
						"
						auto-draw
					></v-sparkline>

					<v-sparkline
						v-if="state.selectedStrand"
						:key="index"
						class="stackSpark"
						:line-width="chartOptions.lineWidth"
						:model-value="
							filterByStrand(state.selectedStrand).map(
								(item) => item.enrollees
							)
						"
						auto-draw
					></v-sparkline>
				</v-sheet>
			</v-col>
			<v-col>
				<v-card>
					<v-skeleton-loader type="card"></v-skeleton-loader> </v-card
			></v-col>
		</v-row>
	</v-container>
</template>

<style scoped>
.v-card {
	font-family: "Inter", serif;
}

.v-card:deep(.v-card-title) {
	font-weight: 600;
	font-size: 32px;
}

.v-combobox {
	width: 20%;
}

.stackSheet {
	position: relative;
}
.stackSpark {
	position: absolute;
	top: 0;
	left: 0;
}
.stackSpark:nth-child(1) {
	color: #7caed2;
}
.stackSpark:nth-child(2) {
	color: #d56363;
}
.stackSpark:nth-child(3) {
	color: #e3d54f;
}
.stackSpark:nth-child(4) {
	color: #74e760;
}
.stackSpark:nth-child(5) {
	color: #b6a7a7;
}
.stackSpark:nth-child(6) {
	color: #e4da78;
}
</style>
