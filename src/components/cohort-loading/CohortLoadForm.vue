<template>
  <div class="form-container">
    <div class="d-flex justify-space-between header">
      <h5 style="font-weight: bold; font-size: 24px">
        COHORT LOADING [{{ facultyToAssign.employee_id }}]
      </h5>
      <h5 class="d-flex gap-3 mr-4 align-center">
        UNIT LOAD:
        <v-chip :color="'green'">
          {{ facultyToAssign.unit_load + "/24" }}
        </v-chip>
      </h5>
    </div>
    <v-divider></v-divider>
    <!-- FACULTY -->
    <div class="faculty-info">
      <div class="d-flex gap-5">
        <div class="d-flex flex-column p-info1">
          <v-label>Name: {{ facultyToAssign.name }}</v-label>
          <v-label class="mt-4"
            >Designation: {{ facultyToAssign.faculty_role }}</v-label
          >
        </div>
        <div class="d-flex flex-column p-info2">
          <v-label
            >Specialization: {{ facultyToAssign.specialization }}</v-label
          >
          <v-label class="mt-4"
            >Cohort: {{ getCohortStatus(facultyToAssign.cohort) }}</v-label
          >
        </div>
      </div>
    </div>
    <!-- SECTION -->
    <v-divider></v-divider>
    <div class="faculty-info">
      <div class="d-flex justify-space-between">
        <v-select
          v-model="selectedSection"
          :items="sectionList"
          item-text="section"
          label="SECTION"
          variant="solo"
          density="compact"
          single-line
          :style="{ maxWidth: '200px' }"
        ></v-select>
        <v-checkbox
          class="mr-10"
          v-model="isAdviser"
          label="Section's Adviser"
        ></v-checkbox>
      </div>
      <div class="d-flex gap-5">
        <div class="d-flex flex-column p-info1">
          <v-label>Room Name: {{ sectionInfo.room_name }}</v-label>
          <v-label class="mt-4">Building: {{ sectionInfo.building }}</v-label>
        </div>
        <div class="d-flex flex-column p-info2">
          <v-label>Strand: {{ sectionInfo.strand_name }}</v-label>
        </div>
      </div>
    </div>
    <!-- DOMAIN -->
    <v-divider></v-divider>
    <div class="faculty-info">
      <v-select
        v-model="selectedDomain"
        :items="[
          'English',
          'Math',
          'Sci-Tech',
          'Specialization',
          'PE',
          'Filipino',
        ]"
        label="DOMAIN"
        variant="solo"
        density="compact"
        single-line
        width="200"
      ></v-select>
      <div class="d-flex gap-5">
        <div class="d-flex flex-column p-info1">
          <v-label>Subject: {{ domainInfo.subject_name }}</v-label>
        </div>
      </div>
    </div>

    <div class="d-flex justify-end gap-5 mt-1 mr-9 action-btn">
      <v-btn @click="cancelTransaction">CANCEL</v-btn>
      <v-btn @click="setCohortLoad" color="green">SUBMIT</v-btn>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      isAdviser: false,
      sectionList: [],
      selectedSection: null,
      selectedDomain: null,
      domainInfo: {
        subject_name: "-------",
      },
      sectionInfo: {
        room_name: "-------",
        building: "-------",
        strand_name: "-------",
      },
    };
  },
  props: {
    facultyToAssign: Object,
  },
  mounted() {
    this.getSectionList(this.facultyToAssign.cohort_name);
  },
  watch: {
    selectedSection: "getSectionInfo",
    selectedDomain: "getSubject",
  },
  methods: {
    setCohortLoad() {
      console.log(this.isAdviser);
      const data = {
        insertCohortLoad: true,
        employee_id: this.facultyToAssign.employee_id,
        section_name: this.selectedSection,
        domain_name: this.selectedDomain,
        isAdviser: this.isAdviser,
      };

      axios
        .post("http://localhost:3000/src/database/cohortloading.php", data)
        .then((response) => {
          console.log(response.data);
          if (response.data.success) {
            alert(
              this.facultyToAssign.employee_id + " ASSIGNMENT IS SUCCESSFUL"
            );
            this.$router.go(0);
          }
        })
        .catch((error) => {
          console.error(error);
          // Handle the error, e.g., show an error message
          alert("Failed to assign. Please try again.");
        });
    },
    cancelTransaction() {
      this.$emit("cancel-transaction");
    },
    getCohortStatus(item) {
      if (item != null && item != "") {
        return item;
      }
      return "N/A";
    },
    getSectionList(cohort_name) {
      try {
        axios
          .get(
            `http://localhost:3000/src/database/enrollment.php?getSectionList&cohort=${cohort_name}`
          )
          .then((response) => {
            this.sectionList = response.data;
          });
      } catch (error) {
        console.error(error);
      }
    },
    getSectionInfo() {
      console.log("it executed");
      try {
        axios
          .get("http://localhost:3000/src/database/cohortloading.php", {
            params: {
              getSectionInfo: true,
              section_name: this.selectedSection,
            },
          })
          .then((response) => {
            this.sectionInfo = response.data;
          });
      } catch (error) {
        console.error(error);
      }

      console.log(this.sectionInfo.room_name);
    },
    getSubject() {
      console.log("it executed");
      try {
        axios
          .get("http://localhost:3000/src/database/cohortloading.php", {
            params: {
              getSubject: true,
              domain_name: this.selectedDomain,
            },
          })
          .then((response) => {
            this.domainInfo = response.data;
          });
      } catch (error) {
        console.error(error);
      }

      console.log(this.domainInfo.subject_name);
    },
  },
};
</script>

<style scoped>
.p-info1 {
  width: 50%;
}
.form-container {
  width: 100%;
  height: 75vh;
  background: white;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
  padding: 30px 20px;
}
</style>
