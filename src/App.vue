<template>
  <v-app>
    <NavBar @change-header="changeHeader" />
    <v-main>
      <Header :title="headerTitle"></Header>
      <router-view />
    </v-main>
  </v-app>
</template>

<script>
import Header from "@/components/Header.vue";
import NavBar from "@/components/NavigationBar.vue";
export default {
  name: "App",
  data() {
    return {
      headerTitle: null,
    };
  },
  components: {
    NavBar,
    Header,
  },
  methods: {
    changeHeader(routerName) {
      const headerTitles = {
        domain: "Setup and Initialization",
        strand: "Setup and Initialization",
        room: "Setup and Initialization",
        facultyRegistration: "Registration",
        studentRegistration: "Registration",
        subjectCreation: "Registration",
        section: "Section and Cohort Management",
        cohort: "Section and Cohort Management",
        cohortAssignment: "Section and Cohort Management",
        classSectioning: "Class Sectioning",
        cohortLoading: "Cohort Loading",
        scheduling: "Scheduling",
      };

      this.headerTitle = headerTitles[routerName] || "Dashboard";
    },
  },
};
</script>
<style scoped></style>
