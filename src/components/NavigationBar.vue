<template>
	<v-navigation-drawer
		v-model="drawer"
		:rail="rail"
		permanent
		@click="rail = false"
	>
		<v-list-item title="SHS OFFICE" value="account" class="nav-header">
			<template v-slot:prepend>
				<img :src="require('@/assets/6.png')" class="logo-img" />
			</template>
			<template v-slot:append>
				<v-btn
					icon="mdi-chevron-left"
					variant="text"
					@click.stop="rail = !rail"
					class="close-btn"
				></v-btn>
			</template>
		</v-list-item>
		<v-divider />
		<!-- NAV LIST HERE -->
		<v-list v-model:opened="open">
			<!-- Dashboard -->
			<v-list-item
				prepend-icon="mdi-home"
				value="Dashboard"
				title="Home"
				:to="{ name: 'dashboard' }"
			></v-list-item>

			<!-- Setup and Initialization -->
			<v-list-group value="Site Setup" :fluid="rail">
				<template v-slot:activator="{ props }">
					<v-list-item
						v-bind="props"
						prepend-icon="mdi-cogs"
						title="Site Setup"
					></v-list-item>
				</template>

				<v-list-item
					v-for="router in setupAndInitialization"
					:key="router.i"
					:prepend-icon="router.router_icon"
					:title="router.title"
					:value="router.title"
					:to="{ name: router.router_name }"
				></v-list-item>
			</v-list-group>

			<!-- FORECASTING -->
			<v-list-item
				title="Summary"
				value="summary"
				:to="{ name: 'summary' }"
			>
				<template v-slot:prepend>
					<v-icon>mdi-chart-areaspline</v-icon>
				</template>
			</v-list-item>

			<!-- Registration -->
			<v-list-group value="Registration" :fluid="rail">
				<template v-slot:activator="{ props }">
					<v-list-item
						v-bind="props"
						prepend-icon="mdi-account-plus-outline"
						title="Registration"
					></v-list-item>
				</template>

				<v-list-item
					v-for="router in registration"
					:key="router.i"
					:prepend-icon="router.router_icon"
					:title="router.title"
					:value="router.title"
					:to="{ name: router.router_name }"
				></v-list-item>
			</v-list-group>

			<!-- Management -->
			<v-list-group value="Management" :fluid="rail">
				<template v-slot:activator="{ props }">
					<v-list-item
						v-bind="props"
						prepend-icon="mdi-google-classroom"
						title="Management"
					></v-list-item>
				</template>

				<v-list-item
					v-for="router in management"
					:key="router.i"
					:prepend-icon="router.router_icon"
					:title="router.title"
					:value="router.title"
					:to="{ name: router.router_name }"
				></v-list-item>
			</v-list-group>

			<!-- Class Sectioning -->
			<v-list-item
				title="Class Sectioning"
				:to="{ name: 'classSectioning' }"
				><template v-slot:prepend>
					<v-icon>mdi-account</v-icon>
				</template></v-list-item
			>
			<!-- COHORTLOADING -->
			<v-list-item
				title="Cohort Loading"
				value="account"
				:to="{ name: 'cohortLoading' }"
			>
				<template v-slot:prepend>
					<v-icon>mdi-account-group</v-icon>
				</template>
			</v-list-item>
			<!-- SCHEDULING -->
			<v-list-item
				title="Scheduling"
				value="schedule"
				:to="{ name: 'scheduling' }"
			>
				<template v-slot:prepend>
					<v-icon>mdi-calendar</v-icon>
				</template>
			</v-list-item>
		</v-list>
	</v-navigation-drawer>
</template>

<script>
import router from "@/router";

export default {
	data() {
		return {
			routerName: null,
			open: [],
			drawer: JSON.parse(localStorage.getItem("drawer")) || true,
			rail: JSON.parse(localStorage.getItem("rail")) || false,
			setupAndInitialization: [
				{
					title: "Domain",
					router_icon: "mdi-domain",
					router_name: "domain",
				},
				{
					title: "Strand",
					router_icon: "mdi-format-list-bulleted",
					router_name: "strand",
				},
				{
					title: "Room",
					router_icon: "mdi-chair-school",
					router_name: "room",
				},
			],
			registration: [
				{
					title: "Faculty",
					router_icon: "mdi-account-tie",
					router_name: "facultyRegistration",
				},
				{
					title: "Student",
					router_icon: "mdi-school",
					router_name: "studentRegistration",
				},
				{
					title: "Subject",
					router_icon: "mdi-book-education",
					router_name: "subjectCreation",
				},
			],
			management: [
				{
					title: "Section",
					router_icon: "mdi-account-tie",
					router_name: "section",
				},
				{
					title: "Cohort",
					router_icon: "mdi-school",
					router_name: "cohort",
				},
			],
		};
	},
	watch: {
		"$route.name": function (newRouteName) {
			this.routerName = newRouteName;
			this.changeRouter();
		},
		rail: "handleListGroup",
		drawer(newDrawer) {
			localStorage.setItem("drawer", JSON.stringify(newDrawer));
		},
		rail(newRail) {
			localStorage.setItem("rail", JSON.stringify(newRail));
		},
	},
	methods: {
		handleListGroup() {
			if (this.rail == true) {
				this.open = [];
			}
		},
		changeRouter() {
			this.$emit("change-header", this.routerName);
		},
	},
};
</script>

<style scoped>
.v-list-item {
	margin-bottom: 10px;
}
.v-label {
	font-size: 14px;
}
.close-btn {
	position: relative;
	left: 25px;
}
.nav-header {
	position: relative;
	left: -9px;
}
.logo-img {
	height: 40px;
	width: 40px;
	display: flex;
	position: relative;
	cursor: pointer;
	transition: 0.3s ease;
	margin-right: 20px;
}
.logo-img:hover {
	transform: translate(-0.1px, 0.5px);
	height: 41.5px;
	width: 41.5px;
}
.v-divider {
	margin: 0px;
}
</style>

<!-- FORECASTING - Multiline -->
<!-- <v-list-group value="Forecasting" :fluid="rail">
	<template v-slot:activator="{ props }">
		<v-list-item
			v-bind="props"
			prepend-icon="mdi-chart-areaspline"
			title="Forecasting"
		></v-list-item>
	</template>

	<v-list-item
		v-for="router in enrollmentForecasting"
		:key="router.i"
		:prepend-icon="router.router_icon"
		:title="router.title"
		:value="router.title"
		:to="{ name: router.router_name }"
	></v-list-item>
</v-list-group> -->

<!-- enrollmentForecasting: [
	{
		title: "Summary",
		router_icon: "mdi-view-dashboard",
		router_name: "enrollmentForecasting",
	},
	{
		title: "History",
		router_icon: "mdi-format-list-bulleted",
		router_name: "enrollmentForecasting",
	},
	{
		title: "Allocation",
		router_icon: "mdi-school",
		router_name: "enrollmentForecasting",
	},
	{
		title: "Forecast",
		router_icon: "mdi-chart-multiple",
		router_name: "enrollmentForecasting",
	},
], -->
<!-- FORECASTING - Multiline End -->
