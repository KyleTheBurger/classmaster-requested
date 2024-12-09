<template>
  <div class="container">
    <div class="faculty-statistic"><FacultyStatistic /></div>
    <div class="faculty-filter">
      <FacultyFilter @handleFilterTable="handleFilterTable" />
    </div>
    <div class="faculty-table">
      <FacultyTable :faculties="faculties" />
    </div>
    <div class="buttons">
      <v-btn @click="importFacultyData" color="rgba(67, 189, 94, 1)">
        <span class="material-symbols-outlined">add_circle</span>IMPORT FACULTY
      </v-btn>
      <input
        type="file"
        ref="fileInput"
        style="display: none"
        @change="handleFileUpload"
      />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import * as XLSX from "xlsx";
import { defineComponent } from "vue";

// Components
import FacultyTable from "@/components/faculty-registration/FacultyTable.vue";
import FacultyFilter from "@/components/faculty-registration/FacultyFilter.vue";
import FacultyStatistic from "@/components/faculty-registration/FacultyStatistic.vue";

export default defineComponent({
  name: "faculty-reg",
  data() {
    return {
      showForm: false,
      faculties: [],
      facultiesToUpdate: [],
    };
  },
  mounted() {
    this.fetchFacultyData();
  },
  methods: {
    downloadFacultyData() {
      const worksheet = XLSX.utils.json_to_sheet(this.faculties);
      const workbook = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(workbook, worksheet, "Faculty Data");

      XLSX.writeFile(workbook, "faculty_data.xlsx");
    },
    fetchFacultyData() {
      axios
        .get(`http://localhost:3000/src/database/faculty.php?getFacultyList`)
        .then((response) => {
          this.faculties = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    handleFilterTable(filter) {
      console.log("it execute");
      axios
        .get("http://localhost:3000/src/database/faculty.php", {
          params: {
            filterFacultyTable: true, // 1
            gender: filter.gender, //2
            status: filter.status,
            name: filter.search,
          },
        })
        .then((response) => {
          this.faculties = response.data;
          this.facultiesToUpdate = response.data; // Store filtered data in facultiesToUpdate
        })
        .catch((error) => {
          console.error(error);
        });
    },
    importFacultyData() {
      this.$refs.fileInput.click();
    },
    handleFileUpload(event) {
      const file = event.target.files[0];
      if (!file) {
        console.log("No file selected");
        return; // Exit if no file is selected
      }
      const reader = new FileReader();

      reader.onload = (e) => {
        const data = new Uint8Array(e.target.result);
        const workbook = XLSX.read(data, { type: "array" });
        const firstSheet = workbook.Sheets[workbook.SheetNames[0]];
        const jsonData = XLSX.utils.sheet_to_json(firstSheet, {
          raw: false,
          defval: "",
        });

        jsonData.forEach((entry) => {
          entry.employee_id = entry.employee_id.toString().padStart(4, "0");
        });

        this.facultiesToUpdate = jsonData;
        this.saveFacultyToUpload();
      };

      reader.readAsArrayBuffer(file);
    },
    saveFacultyToUpload() {
      axios
        .post(
          "http://localhost:3000/src/database/faculty.php",
          this.facultiesToUpdate
        )
        .then((response) => {
          console.log("Data saved successfully:", response.data);
          // Optionally, you can update the local faculties list or perform other actions here
          alert("Faculty List has been Updated");
          this.$router.go(0);
        })
        .catch((error) => {
          console.error("Error saving data:", error);
        });
    },
  },
  components: {
    FacultyTable,
    FacultyFilter,
    FacultyStatistic,
  },
});
</script>

<style scoped>
h1 span {
  margin-left: 10px;
}
.container {
  width: 100%;
}
.faculty-statistic {
  margin: 20px 0px 20px 0px;
}
.buttons {
  margin: 20px 0;
  display: flex;
  justify-content: end;
  gap: 30px;
}
.buttons span {
  width: 20px;
  margin-right: 15px;
}
.faculty-table {
  width: 100%;
  padding: 5px 20px 20px 20px;
  border: 1px solid rgb(222, 220, 220);
  border-radius: 3px;
  box-shadow: 5px 5px 3px rgb(212, 212, 212);
  display: grid;
  place-items: center;
}
</style>
