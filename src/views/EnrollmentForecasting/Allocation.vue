<script setup>
import ForecastingStatistic from "@/components/enrollment-forecasting/ForecastingStatistic.vue";
import { onMounted } from "vue";
import { reactive } from "vue";

const state = reactive({
	enrolleeStats: [],
	sectionStats: [],
	roomStats: [],
	isLoading: true,
});

const Stat = (label, data) => {
	return {
		label: label,
		data: data,
	};
};

const strandList = ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"];
const algorithms = ["Moving Average", "Exponential Smoothing", "SARIMA"];

onMounted(async () => {
	try {
		await loadEnrolleePredictions();
		await calculateSections(state.enrolleeStats[0]);
		await calculateRooms();
	} catch (error) {
	} finally {
		state.isLoading = false;
		console.log("Section Stats:");
		state.sectionStats.forEach((stat) => {
			console.log(stat.label, stat.data);
		});
		console.log("Room Stats:");
		state.roomStats.forEach((stat) => {
			console.log(stat.label, stat.data);
		});
	}
});

const loadEnrolleePredictions = async () => {
	let enrolees = [];
	state.enrolleeStats.push({
		algorithm: "Moving Average",
		predictions: [
			Stat("ABM", 131),
			Stat("STEM", 197),
			Stat("HUMSS", 128),
			Stat("GAS", 108),
			Stat("HE-FBS", 93),
			Stat("ICT-CP", 113),
		],
	});

	state.enrolleeStats.push({
		algorithm: "Exponential Smoothing",
		predictions: [
			Stat("ABM", 133),
			Stat("STEM", 190),
			Stat("HUMSS", 135),
			Stat("GAS", 100),
			Stat("HE-FBS", 95),
			Stat("ICT-CP", 120),
		],
	});

	state.enrolleeStats.push({
		algorithm: "SARIMA",
		predictions: [
			Stat("ABM", 140),
			Stat("STEM", 200),
			Stat("HUMSS", 140),
			Stat("GAS", 110),
			Stat("HE-FBS", 100),
			Stat("ICT-CP", 115),
		],
	});
};

const calculateSections = (enrolleesStat) => {
	enrolleesStat.predictions.forEach((stat) => {
		state.sectionStats.push(Stat(stat.label, Math.ceil(stat.data / 50)));
	});
};

const calculateRooms = () => {
	state.sectionStats.forEach((stat) => {
		state.roomStats.push(Stat(stat.label, stat.data));
	});
	state.roomStats.push(Stat("Lab", 2));
};
</script>

<template>
	<!-- <v-btn to="/enrollment-forecasting/summary" variant="outlined"
		>Back to Summary</v-btn
	> -->
</template>

<style scoped>
#cyan {
	width: 280px;
	background-color: #7caed266;
}
</style>
