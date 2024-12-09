<template>
  <div class="container">
    <div class="d-flex flex-column mt-5 justify-center gap-2">
      <v-label class="d-flex text-h5 font-weight-bold justify-center"
        >COHORT ASSIGNMENT [&nbsp;{{ cohortName }}&nbsp;]</v-label
      >
    </div>
    <div class="d-flex justify-space-between align-center assignment-table">
      <!-- FACULTY TABLE -->
      <div class="faculty-table">
        <div class="d-flex justify-space-between align-center header">
          <div class="title d-flex justify-center text-h5 ml-5">
            FACULTY TABLE
          </div>
          <v-text-field
            v-model="search"
            prepend-inner-icon="mdi-magnify"
            label="Search by name"
            variant="solo"
            class="mr-7 search"
            density="compact"
            single-line
          ></v-text-field>
        </div>
        <v-data-table-virtual
          :headers="headers"
          :items="facultyTable"
          height="425"
          style="font-size: 13px"
          item-value="id"
          class="table"
          :header-props="{ style: 'font-size:14px;' }"
        >
          <template #[`item.action`]="{ item }">
            <v-btn
              color="primary"
              @click="assign(item, 'Learning Facilitator')"
              class="detail-btn"
            >
              <span class="material-symbols-outlined"> chevron_right </span>
            </v-btn>
          </template>
          <template #[`item.name`]="{ value }">
            <span style="font-weight: 500">{{ value }}</span>
          </template>
        </v-data-table-virtual>
      </div>

      <v-icon>mdi-arrow-right</v-icon>

      <!-- PREVIEW TABLE -->
      <div class="faculty-table">
        <div class="d-flex justify-center text-h5 header">
          ASSIGNED FACULTY (&nbsp;{{ assignedFaculty.length }}&nbsp;)
        </div>
        <v-data-table-virtual
          :headers="AssignedFacultyHeaders"
          :items="assignedFaculty"
          height="425"
          style="font-size: 13px"
          item-value="id"
          class="table"
          :header-props="{ style: 'font-size:14px;' }"
          no-data-text="No Faculty has been assigned yet"
        >
          <template #[`item.action`]="{ item }">
            <v-btn color="red" @click="remove(item)" class="detail-btn">
              <span class="material-symbols-outlined"> remove </span>
            </v-btn>
          </template>

          <template #[`item.designation`]="{ item }">
            <v-select
              single-line
              :items="['Learning Facilitator', 'Learning Supervisor']"
              variant="plain"
              class="mx-auto d-flex mb-2 mr-2 designation-btn"
              density="compact"
              :style="{ width: '200px', height: '30px' }"
              :modelValue="item.designation"
              @update:modelValue="
                (newValue) => changeDesignation(item, newValue)
              "
            >
            </v-select>
          </template>

          <template #[`item.name`]="{ value }">
            <span style="font-weight: 500">{{ value }}</span>
          </template>
        </v-data-table-virtual>
      </div>
    </div>
    <div class="d-flex justify-end gap-5 mt-2 op-btn">
      <v-btn :to="{ name: 'cohort' }">GO BACK</v-btn>
      <v-btn @click="saveAssignment">SAVE ASSIGNMENT</v-btn>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: {
    cohortName: {
      type: String,
      required: true,
    },
  },
  mounted() {
    console.log("Cohort Name:", this.cohortName);
    this.fetchFacultyData(this.cohortName);
    this.fetchCohortFaculty(this.cohortName);
  },
  data() {
    return {
      search: "",
      headers: [
        { title: "Name", align: "start", key: "name" },
        {
          title: "Cohort",
          align: "center",
          key: "no_of_cohort",
          sortable: false,
        },
        {
          title: "Specialization",
          align: "start",
          key: "specialization",
          sortable: false,
        },
        { title: "Action", align: "center", key: "action", sortable: false },
      ],
      AssignedFacultyHeaders: [
        { title: "Name", align: "start", key: "name" },
        {
          title: "designation",
          align: "center",
          key: "designation",
          sortable: false,
        },
        { title: "Action", align: "center", key: "action", sortable: false },
      ],
      facultyTable: [],
      assignedFaculty: [],
    };
  },
  watch: {
    search(newSearchValue) {
      this.fetchFacultyData(this.cohortName);
    },
  },
  methods: {
    fetchFacultyData(cohortName) {
      axios
        .get("http://localhost:3000/src/database/cohort.php", {
          params: {
            getCohortFacultyTableList: true,
            cohort: cohortName,
            search: this.search,
          },
        })
        .then((response) => {
          this.facultyTable = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    fetchCohortFaculty(cohortName) {
      axios
        .get(
          `http://localhost:3000/src/database/cohort.php?getCohortFaculty&cohort=${cohortName}`
        )
        .then((response) => {
          // Assuming response.data is an array of faculty objects
          const facultyList = response.data;
          console.log(facultyList);
          // Move all fetched faculty to assignedFaculty and remove from facultyTable
          this.assignedFaculty = [...this.assignedFaculty, ...facultyList];
          this.facultyTable = this.facultyTable.filter(
            (faculty) => !facultyList.some((f) => f.id === faculty.employee_id)
          );
        })
        .catch((error) => {
          console.error(error);
        });
    },
    assign(faculty) {
      // Remove the faculty from facultyTable
      const index = this.facultyTable.findIndex(
        (f) => f.employee_id === faculty.employee_id
      );
      if (index !== -1) {
        this.facultyTable.splice(index, 1);
      }

      // Add the faculty to assignedFaculty
      this.assignedFaculty.push({
        cohort_assignment_id: faculty.cohort_assignment_id,
        id: faculty.employee_id,
        name: faculty.name,
        no_of_cohort: faculty.no_of_cohort,
        specialization: faculty.specialization,
        designation: "Learning Facilitator",
      });
    },
    remove(item) {
      // Find the index of the item in assignedFaculty
      const index = this.assignedFaculty.findIndex((f) => f.id === item.id);
      if (index !== -1) {
        // Remove the item from assignedFaculty
        const removedItem = this.assignedFaculty.splice(index, 1)[0];

        // Add the removed item back to facultyTable
        this.facultyTable.push({
          cohort_assignment_id: removedItem.cohort_assignment_id,
          employee_id: removedItem.id,
          name: removedItem.name,
          no_of_cohort: removedItem.no_of_cohort,
          specialization: item.specialization,
          designation: "Learning Facilitator",
        });
      }
      this.facultyTable.sort((a, b) => a.name.localeCompare(b.name));
    },
    changeDesignation(faculty, newValue) {
      if (newValue === "Learning Supervisor") {
        const existingSupervisor = this.assignedFaculty.find(
          (f) => f.designation === "Learning Supervisor"
        );
        if (existingSupervisor) {
          alert("There is already a Learning Supervisor assigned.");
          return;
        }
      }
      faculty.designation = newValue;
    },
    saveAssignment() {
      const data = {
        saveCohortAssignment: true,
        facultyData: this.assignedFaculty,
        cohort: this.cohortName,
      };
      console.log(data.facultyData);

      axios
        .post("http://localhost:3000/src/database/cohort.php", data)
        .then((response) => {
          console.log(response.data);
          this.fetchCohortFaculty();
          alert("COHORT: " + this.cohortName + " has successfully updated");
          this.$router.go(0);
        })
        .catch((error) => {
          console.error("There was an error!", error);
        });
    },
  },
};
</script>

<style scoped>
.table {
  width: 600px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  padding: 0px 20px 10px 20px;
}
.assignment-table {
  padding: 15px 20px 0px 20px;
}
.header {
  padding: 7px 0px;
  background: rgb(235, 97, 97);
  color: white;
}
.search {
  background: gray;
  max-width: 240px;
  height: 40px;
}
</style>
