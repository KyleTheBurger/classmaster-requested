<script setup>
import EnrollmentChart from "@/components/enrollment-forecasting/EnrollmentChart.vue";
import EnrollmentHistory from "@/components/enrollment-forecasting/EnrollmentHistory.vue";
import CounterCards from "@/components/enrollment-forecasting/CounterCards.vue";

const strandList = ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"];
const gradeLevelList = [11, 12];

const cardData = [
	{
		cardTitle: "Estimated Enrollees",
		cardValue: "800",
		cardColor: "#F3EDB5",
	},
	{
		cardTitle: "Estimated Rooms Required",
		cardValue: "18",
		cardColor: "#B5CAF3",
	},
	{
		cardTitle: "Estimated Sections",
		cardValue: "18",
		cardColor: "#EDBDBD",
	},
	{
		cardTitle: "Estimated Faculty Demand",
		cardValue: "40",
		cardColor: "#BEF3B5",
	},
];
</script>

<template>
	<div class="container">
		<h1>Enrollment Forecasting</h1>
		<div class="content-views">
			<EnrollmentHistory />
			<EnrollmentChart />
		</div>
		<div class="counter-cards">
			<CounterCards
				v-for="card in cardData"
				:key="card"
				:card-title="card.cardTitle"
				:card-value="card.cardValue"
				:card-color="card.cardColor"
			/>
		</div>
	</div>
</template>
