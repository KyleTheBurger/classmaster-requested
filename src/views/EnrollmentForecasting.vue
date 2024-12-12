<script setup>
import EnrollmentChart from "@/components/enrollment-forecasting/EnrollmentChart.vue";
import EnrollmentHistory from "@/components/enrollment-forecasting/EnrollmentHistory.vue";
import CounterCards from "@/components/enrollment-forecasting/CounterCards.vue";
import { reactive, onMounted } from "vue";
import axios from "axios";

const state = reactive({
	historicalData: {},
	isLoading: true,
});
const strandList = ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"];

onMounted(async () => {
	try {
		const PATH = "http://localhost:5000/history";
		const response = await axios.get(PATH);
		state.historicalData = response.data;
	} catch (error) {
		console.error("Error fetching historical data:", error);
	} finally {
		state.isLoading = false;
	}
});
</script>

<template>
	<div v-if="!state.isLoading" class="container">
		<h1>Enrollment Forecasting</h1>
		<div class="content-views">
			<EnrollmentHistory />
			<EnrollmentChart />
		</div>
		<div class="counter-cards">
			<!-- <CounterCards
				v-for="card in dummyCardData"
				:key="card"
				:card-title="card.cardTitle"
				:card-value="card.cardValue"
				:card-color="card.cardColor"
			/> -->
		</div>
	</div>
</template>
