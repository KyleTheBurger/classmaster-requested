<script setup>
import ForecastingStatistic from "@/components/enrollment-forecasting/ForecastingStatistic.vue";
import { computed, defineProps, onMounted, reactive } from "vue";

const props = defineProps({
	isPreview: {
		type: Boolean,
		default: false,
	},
});

const state = reactive({
	enrolleeStats: [],
	sectionStats: [],
	roomStats: [],
	selectedAlgorithm: "Moving Average",
	selectedSY: "2024-2025 1st Semester",
	isLoading: true,
});

const enrolleeSum = computed(() => {
	let sum = 0;
	state.enrolleeStats.forEach((stat) => {
		sum += stat.data;
	});
	return sum;
});

const sectionSum = computed(() => {
	let sum = 0;
	state.sectionStats.forEach((stat) => {
		sum += stat.data;
	});
	return sum;
});

const roomSum = computed(() => {
	let sum = 0;
	state.roomStats.forEach((stat) => {
		sum += stat.data;
	});
	return sum;
});

const Stat = (label, data) => {
	return {
		label: label,
		data: data,
	};
};

const strandList = ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"];
const semesters = [
	"2024-2025 1st Semester",
	"2024-2025 2nd Semester",
	"2025-2026 1st Semester",
	"2025-2026 2nd Semester",
];
const algorithms = ["Moving Average", "Exponential Smoothing", "SARIMA"];

onMounted(async () => {
	try {
		await loadEnrolleePredictions(state.selectedAlgorithm);
		await calculateSections();
		await calculateRooms();
	} catch (error) {
	} finally {
		state.isLoading = false;
	}
});

const loadEnrolleePredictions = async (algorithm) => {
	console.log(algorithm);
	switch (algorithm) {
		case "Moving Average":
			state.enrolleeStats = [];
			state.enrolleeStats.push(Stat("ABM", 131));
			state.enrolleeStats.push(Stat("STEM", 197));
			state.enrolleeStats.push(Stat("HUMSS", 128));
			state.enrolleeStats.push(Stat("GAS", 108));
			state.enrolleeStats.push(Stat("HE-FBS", 93));
			state.enrolleeStats.push(Stat("ICT-CP", 113));
			break;
		case "Exponential Smoothing":
			state.enrolleeStats = [];
			state.enrolleeStats.push(Stat("ABM", 133));
			state.enrolleeStats.push(Stat("STEM", 190));
			state.enrolleeStats.push(Stat("HUMSS", 135));
			state.enrolleeStats.push(Stat("GAS", 100));
			state.enrolleeStats.push(Stat("HE-FBS", 95));
			state.enrolleeStats.push(Stat("ICT-CP", 120));
			break;
		case "SARIMA":
			state.enrolleeStats = [];
			state.enrolleeStats.push(Stat("ABM", 140));
			state.enrolleeStats.push(Stat("STEM", 200));
			state.enrolleeStats.push(Stat("HUMSS", 140));
			state.enrolleeStats.push(Stat("GAS", 110));
			state.enrolleeStats.push(Stat("HE-FBS", 100));
			state.enrolleeStats.push(Stat("ICT-CP", 115));
			break;
	}
};

const calculateSections = () => {
	state.sectionStats = [];
	state.enrolleeStats.forEach((stat) => {
		state.sectionStats.push(Stat(stat.label, Math.ceil(stat.data / 50)));
	});
};

const calculateRooms = () => {
	state.roomStats = [];
	state.sectionStats.forEach((stat) => {
		state.roomStats.push(Stat(stat.label, stat.data));
	});
	state.roomStats.push(Stat("Lab", 2));
};
</script>

<template>
	<v-container v-if="!state.isLoading" class="pb-10 container">
		<v-card
			v-if="!isPreview"
			class="mb-10 px-10 pt-10 rounded-lg elevation-3 header-box round"
		>
			<v-row><h1>Resource Allocation</h1></v-row>
			<v-row class="d-flex justify-space-between w-100 align-center ga-5">
				<v-col class="d-flex gap-3 align-center">
					<div class="font-weight-bold">
						<p>Prediction Algorithm:</p>
					</div>
					<v-combobox
						v-model="state.selectedAlgorithm"
						auto-select-first="exact"
						variant="solo-filled"
						:items="algorithms"
					></v-combobox>
				</v-col>
				<v-col class="d-flex gap-3 align-center">
					<div class="font-weight-bold"><p>Forecast for:</p></div>
					<v-combobox
						v-model="state.selectedSY"
						auto-select-first="exact"
						variant="solo-filled"
						:items="semesters"
					></v-combobox>
				</v-col>
			</v-row>
		</v-card>

		<v-row class="gap-5 px-4 card-section">
			<v-col id="enrolleesCol" class="card-column elevation-3">
				<ForecastingStatistic
					class="font-weight-medium"
					type="number"
					label="Total Enrollees"
					prepend-icon="mdi-account"
					readonly="true"
					isMain="true"
					:value="enrolleeSum"
				></ForecastingStatistic>
				<v-btn
					v-if="!isPreview"
					prepend-icon="mdi-reload"
					color="accent"
					class="mx-5 my-4"
					@click="loadEnrolleePredictions(state.selectedAlgorithm)"
					>Reload Prediction</v-btn
				>
				<ForecastingStatistic
					v-if="!isPreview"
					v-for="stat in state.enrolleeStats"
					:key="stat.label"
					:label="stat.label"
					:value="stat.data"
					icon="mdi-account"
					:updateHandler="
						(newVal) => {
							stat.data = newVal;
						}
					"
					:deleteHandler="
						() => {
							// delete this element
							const index = state.enrolleeStats.indexOf(stat);
							if (index > -1) {
								state.enrolleeStats.splice(index, 1);
							}
						}
					"
				></ForecastingStatistic>
			</v-col>
			<v-col id="sectionsCol" class="card-column elevation-3">
				<ForecastingStatistic
					class="font-weight-medium"
					type="number"
					label="Total Sections"
					prepend-icon="mdi-human-male-board"
					readonly="true"
					isMain="true"
					:value="sectionSum"
				></ForecastingStatistic>
				<v-btn
					v-if="!isPreview"
					prepend-icon="mdi-reload"
					color="accent"
					class="mx-5 my-4"
					@click="calculateSections"
					>Recalculate Sections</v-btn
				>
				<ForecastingStatistic
					v-if="!isPreview"
					v-for="stat in state.sectionStats"
					:key="stat.label"
					:label="stat.label"
					:value="stat.data"
					icon="mdi-account-multiple"
					:updateHandler="
						(newVal) => {
							stat.data = newVal;
						}
					"
					:v-model="roomSum"
					:deleteHandler="
						() => {
							// delete this element
							const index = state.sectionStats.indexOf(stat);
							if (index > -1) {
								state.sectionStats.splice(index, 1);
							}
						}
					"
				></ForecastingStatistic
			></v-col>
			<v-col id="roomsCol" class="card-column elevation-3">
				<ForecastingStatistic
					class="font-weight-medium"
					type="number"
					label="Total Rooms"
					prepend-icon="mdi-door"
					readonly="true"
					isMain="true"
					:value="roomSum"
				></ForecastingStatistic>
				<v-btn
					v-if="!isPreview"
					prepend-icon="mdi-reload"
					color="accent"
					class="mx-5 my-4"
					@click="calculateRooms"
					>Recalculate Rooms</v-btn
				>
				<ForecastingStatistic
					v-if="!isPreview"
					v-for="stat in state.roomStats"
					:key="stat.label"
					:label="stat.label"
					:value="stat.data"
					icon="mdi-door"
					:updateHandler="
						(newVal) => {
							stat.data = newVal;
						}
					"
					:deleteHandler="
						() => {
							// delete this element
							const index = state.roomStats.indexOf(stat);
							if (index > -1) {
								state.roomStats.splice(index, 1);
							}
						}
					"
				></ForecastingStatistic
			></v-col>
		</v-row>
	</v-container>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Karla:ital,wght@0,200..800;1,200..800&display=swap");
.card-column {
	display: flex;
	flex-direction: column;
	background-color: #64646466;
	min-width: 250px;
	border-radius: 8px;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

.card-column:nth-child(1) {
	background-color: #7caed266;
}

.card-column:nth-child(2) {
	background-color: #d5636366;
}

.card-column:nth-child(3) {
	background-color: #e3d54f66;
}

.header-box {
	font-family: "Inter", serif;
}
</style>
