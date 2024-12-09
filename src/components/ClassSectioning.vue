<template>
  <v-card flat>
    <v-container>
      <v-row>
        <v-col cols="4">
          <v-card class="statContainer1">
            <v-card-title>
              <v-icon left>mdi-check-circle</v-icon>
              {{ sectionList.length }} Available Section(s).
            </v-card-title>
          </v-card>
        </v-col>
        <v-col cols="4">
          <v-card class="statContainer2">
            <v-card-title>
              <v-icon left>mdi-account-check</v-icon>
              54 Students Assigned to Section
            </v-card-title>
          </v-card>
        </v-col>
        <v-col cols="4">
          <v-card class="statContainer3">
            <v-card-title class="statThree">
              <v-icon left>mdi-account-alert</v-icon>
             373 Students didn't assign to Section
            </v-card-title>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
    <v-card class="mx-4" flat>
      <v-row>
        <v-col cols="6">
          <v-row class="d-flex justify-space-between align-center">
            <v-col cols="2" md="4">
              <v-select
                label="Strand"
                v-model="strand"
                :items="strandList"
                density="compact"
                variant="solo-filled"
              ></v-select>
            </v-col>
            <v-col cols="2" md="4">
              <v-select
                label="Grade level"
                v-model="gradeLevel"
                :items="gradeLevelList"
                density="compact"
                variant="solo-filled"
              ></v-select>
            </v-col>
            <v-col cols="2" md="4">
              <v-select
                label="Shift"
                v-model="shift"
                :items="shiftList"
                density="compact"
                variant="solo-filled"
              ></v-select>
            </v-col>
          </v-row>
          <v-data-table-virtual
            :headers="headers"
            :items="filteredStudents"
            height="450"
            class="table"
            fixed-header
            :header-props="{ style: 'background-color:#E0E0E0', }"
          >
            <template v-slot:item.button="{ item }">
              <v-btn
                @click="addToSection(item)"
                color="green"
                variant="tonal"
                class="addremoveBtn"
                :disabled="isAddButtonDisabled"
              >
              <span class="material-symbols-outlined">add</span> 
                <!-- Add to Section -->
              </v-btn>
            </template>
          </v-data-table-virtual>
        </v-col>

        <v-col cols="6">
          <v-row class="d-flex justify-space-between align-center">
            <v-col cols="2" md="4"></v-col>
            <v-col cols="2" md="4">
              <v-select
                label="Section"
                v-model="section"
                :items="sectionList"
                density="compact"
                variant="solo-filled"
                :disabled="isSectionDropdownDisabled"
              ></v-select>
            </v-col>
          </v-row>

          <p class="displaySelectedSection">
            <span class="strand"><strong>STRAND:</strong> {{ strand }}</span>
            <span class="section"><strong>SECTION:</strong> {{ section }}</span>
        </p>

        <v-data-table-virtual
        :headers="headers"
        :items="sectionedStudents"
        height="350"
        class="table"
        fixed-header
        :header-props="{ style: 'background-color:#E0E0E0' }"
      >
        <template v-slot:item.button="{ item }">
          <v-btn @click="removeFromSection(item)" color="red" class="addremoveBtn" variant="tonal">
            <span class="material-symbols-outlined">cancel</span> 
            <!-- Remove -->
          </v-btn>
        </template>
      </v-data-table-virtual>

          <p class="noOfStudents">
            <strong class="NumGenderDisplay">{{ genderCounts.male }}</strong>  MALE <br> <strong class="NumGenderDisplay">{{ genderCounts.female }}</strong> FEMALE.
          </p>
          <v-btn color="green-lighten-1" class="setSection" :disabled="isSetSectionButtonDisabled" @click="setSection"><span class="material-symbols-outlined">
            assignment_turned_in
            </span>Set-Section</v-btn>
        </v-col>
      </v-row>
    </v-card>
  </v-card>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      strand: "",
      gradeLevel: "",
      shift: "",
      section: "",
      strandList: ["ABM", "STEM", "HUMSS", "GAS", "HE-FBS", "ICT-CP"],
      gradeLevelList: [11, 12],
      shiftList: ["Morning", "Afternoon"],
      sectionList: [],
      selectedStudents: [],
      sectionedStudents: [],
      headers: [
        { title: "Student ID", align: "left", value: "student_id" },
        { title: "Name", align: "left", value: "name" },
        { title: "Strand", align: "left", value: "strand" },
        { title: "Grade Level", align: "left", value: "grade_level" },
        { title: "Shift", align: "left", value: "shift" },
        { title: "Button", align: "center", value: "button", sortable: false },
      ],
      genderCounts: {
        male: 0,
        female: 0,
      },
    };
  },
  mounted() {
    this.getStudents();
    this.getSections();
  },
  methods: {
    async getStudents() {
      try {
        const response = await axios.get("http://localhost:3000/sectioning/src/database/Enrollmentdb.php");
        this.selectedStudents = response.data;
      } catch (error) {
        console.error(error);
      }
    },
    async getSections() { 
      try {
        const response = await axios.get("http://localhost:3000/sectioning/src/database/SectionFilter.php");
        const data = response.data;
        this.sectionList = data.available_sections;
      } catch (error) {
        console.error("Error fetching sections:", error);
      }
    },
    async setSection() {
      try {
      const response = await axios.post("http://localhost:3000/sectioning/src/database/SetSection.php", {
        section: this.section,
        students: this.sectionedStudents.map(student => student.student_id)
      });
      if (response.data.success) {
        alert("Section set successfully!");
      } else {
        alert("Failed to set section.");
      }
    } catch (error) {
      console.error("Error setting section:", error);
    }
  },  
    addToSection(student) {
      if (this.sectionedStudents.length >= 45) {
        alert("You can only add 45 students per section.");
        return;
      }
      this.sectionedStudents.push(student);
      this.selectedStudents = this.selectedStudents.filter(
        (s) => s.student_id !== student.student_id
      );
      this.updateGenderCounts();
    },
    removeFromSection(student) {
      this.selectedStudents.push(student);
      this.sectionedStudents = this.sectionedStudents.filter(
        (s) => s.student_id !== student.student_id
      );
      this.updateGenderCounts();
    },
    updateGenderCounts() {
      this.genderCounts.male = this.sectionedStudents.filter(student => student.gender === 'Male').length;
      this.genderCounts.female = this.sectionedStudents.filter(student => student.gender === 'Female').length;
    }
  },
  computed: {
    filteredStudents() {
    return this.selectedStudents.filter(student => {
      return (
        (!this.strand || student.strand === this.strand) &&
        (!this.gradeLevel || parseInt(student.grade_level) === parseInt(this.gradeLevel)) &&
        (!this.shift || student.shift === this.shift)
      );
    });
  },
  isAddButtonDisabled() {
      return !(this.strand && this.gradeLevel && this.shift);
    },
    isSectionDropdownDisabled() {
      return this.sectionedStudents.length === 0;
    },
    isSetSectionButtonDisabled() {
    return !(this.section && this.sectionedStudents.length > 0);
  }
  },
};
</script>

<style scoped>
.text-center {
  text-align: center;
}
.table {
  border: 2px solid #f1f0f0;
  border-radius: 4px;
}
.setSection {
  margin-top: 10px;
  float: right;
}
.statContainer1, .statContainer2, .statContainer3 {
  padding: 10px;
  border: 1px solid #f1f0f0;
  border-radius: 4px;
}
.statContainer1 {
  background-color: #a1b3cf;
}
.statContainer2 {
  background-color: #f1dba5;
}
.statContainer3 {
  background-color: #d6b2e3;
}
.noOfStudents {
  font-size: 10px;  
  font-weight: bold;
  color: rgb(131, 131, 131);
}
.NumGenderDisplay{
  color:rgb(68, 76, 227);
  font-size: 14px;
}
.displaySelectedSection {
  font-size: 14px;
  display: flex;
  justify-content: space-between;
  width: 100%;
}
.strand, .section {
  flex: 1;
}
.addremoveBtn {
  padding: 5px 10px;
  font-size: 10px;
  border-radius: 4px;
  margin: 0;
}
</style>
