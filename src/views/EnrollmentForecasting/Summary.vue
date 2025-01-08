<script setup>
import { reactive, onMounted } from "vue";
import axios from "axios";
import Allocation from "./Allocation.vue";
import History from "./History.vue";

const state = reactive({
	historicalData: {},
	forecastingData: {},
	isLoading: true,
});
const strandList = ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"];

const Stat = (label, data) => {
	return {
		label: label,
		data: data,
	};
};

onMounted(async () => {
	try {
		await loadHitoricalData();
		await loadForecastingData();
	} catch (error) {
	} finally {
		state.isLoading = false;
		console.log(state.historicalData);
		console.log(state.forecastingData["enrolees"]);
		console.log(state.forecastingData["sections"]);
		console.log(state.forecastingData["rooms"]);
		console.log(state.forecastingData["teachers"]);
	}
});

// Temporary function hoods for fetching data, update for when mysql is implemented
var loadHitoricalData = async () => {
	try {
		const PATH = "http://localhost:5000/history";
		const response = await axios.get(PATH);
		state.historicalData = response.data;
	} catch (error) {
		console.error("Error fetching historical data:", error);
	}
};

var loadForecastingData = async () => {
	let forecastingData = {};

	var convertToStats = (intArray) => {
		let cards = [];
		for (let i = 0; i < strandList.length; i++) {
			cards.push(Stat(strandList[i], intArray[i]));
		}
		return cards;
	};

	forecastingData["enrollees"] = convertToStats([
		131, 197, 128, 108, 93, 113,
	]);
	forecastingData["sections"] = convertToStats([3, 4, 3, 3, 2, 3]);
	forecastingData["rooms"] = convertToStats([3, 4, 3, 3, 2, 3]);
	forecastingData["rooms"].push(Stat("Lab", 2));
	forecastingData["teachers"] = convertToStats([6, 8, 6, 8, 4, 6]);

	state.forecastingData = forecastingData;
};
</script>

<template>
	<div v-if="!state.isLoading" class="container">
		<h1>Enrollment Forecasting</h1>
		<div class="content-views"></div>

		<v-card>
			<History :isPreview="true" class="mb-0" />
		</v-card>

		<v-card>
			<Allocation :isPreview="true" class="mb-0" />
		</v-card>
	</div>
</template>
