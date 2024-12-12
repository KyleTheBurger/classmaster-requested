import { createRouter, createWebHistory } from "vue-router";
import Dashboard from "@/views/Dashboard.vue";

import Domain from "@/views/Setup/Domain.vue";
import Strand from "@/views/Setup/Strand.vue";
import Room from "@/views/Setup/Room.vue";

import FacultyRegistration from "@/views/Registration/FacultyRegistration.vue";
import SubjectCreation from "@/views/Registration/SubjectCreation.vue";
import StudentRegistration from "@/views/Registration/StudentRegistration.vue";

import Section from "@/views/Management/Section.vue";
import Cohort from "@/views/Management/Cohort.vue";
import CohortAssignment from "@/views/Management/CohortAssignment.vue";

import ClassSectioning from "@/views/ClassSectioning.vue";
import CohortLoading from "@/views/CohortLoading.vue";
import Scheduling from "@/views/Scheduling.vue";

import Summary from "@/views/EnrollmentForecasting/Summary.vue";
import History from "@/views/EnrollmentForecasting/History.vue";
import Allocation from "@/views/EnrollmentForecasting/Allocation.vue";
import Forecast from "@/views/EnrollmentForecasting/Forecast.vue";

const routes = [
	{
		path: "/",
		name: "dashboard",
		component: Dashboard,
	},
	// Setup and Initialization
	{
		path: "/setup-and-initialization/domain",
		name: "domain",
		component: Domain,
	},
	{
		path: "/setup-and-initialization/strand",
		name: "strand",
		component: Strand,
	},
	{
		path: "/setup-and-initialization/room",
		name: "room",
		component: Room,
	},

	// Registration and Configuration
	{
		path: "/registration/faculty-registration",
		name: "facultyRegistration",
		component: FacultyRegistration,
	},
	{
		path: "/registration/subject-creation",
		name: "subjectCreation",
		component: SubjectCreation,
	},
	{
		path: "/registration/student-registration",
		name: "studentRegistration",
		component: StudentRegistration,
	},

	// Section and Cohort Management
	{
		path: "/section-and-cohort-management/section",
		name: "section",
		component: Section,
	},
	{
		path: "/section-and-cohort-management/cohort",
		name: "cohort",
		component: Cohort,
	},
	{
		path: "/section-and-cohort-management/cohort/cohort-assingment/:cohortName",
		name: "cohortAssignment",
		component: CohortAssignment,
		props: true,
	},

	// Class Sectioning and Scheduling
	{
		path: "/class-sectioning",
		name: "classSectioning",
		component: ClassSectioning,
	},
	{
		path: "/cohortloading",
		name: "cohortLoading",
		component: CohortLoading,
	},
	{
		path: "/scheduling",
		name: "scheduling",
		component: Scheduling,
	},

	// Enrollment Forecasting
	{
		path: "/enrollment-forecasting/summary",
		name: "summary",
		component: Summary,
	},
	{
		path: "/enrollment-forecasting/history",
		name: "history",
		component: History,
	},
	{
		path: "/enrollment-forecasting/allocation",
		name: "allocation",
		component: Allocation,
	},
	{
		path: "/enrollment-forecasting/forecast",
		name: "forecast",
		component: Forecast,
	},
];

const router = createRouter({
	history: createWebHistory(process.env.BASE_URL),
	routes,
});

export default router;
