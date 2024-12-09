<template>
  <div class="form-container">
    <h3 class="d-flex justify-center align-center form-title">
      {{ formTitle }}
    </h3>
    <div class="pl-10 pr-10 form">
      <div class="d-flex mt-1">
        <div class="d-flex flex-column">
          <v-label style="margin-bottom: 10px">Subject Name</v-label>
          <v-text-field
            v-model="subject.name"
            prepend-inner-icon="mdi-book"
            label="subject name"
            required
            class="subject"
            variant="outlined"
            single-line
            density="compact"
            :style="{ width: '300px' }"
          ></v-text-field>
        </div>
        <v-radio-group
          v-model="subject.lvl"
          label="Subject Level"
          class="d-flex ml-10 radio-group"
          inline
        >
          <v-radio label="11" value="11"></v-radio>
          <v-radio label="12" value="12"></v-radio>
        </v-radio-group>
      </div>
      <v-divider></v-divider>
      <div class="d-flex">
        <div class="d-flex flex-column">
          <v-label style="margin-bottom: 10px">Domain: </v-label>
          <v-select
            v-model="subject.domain"
            single-line
            label="ENGLISH"
            :items="['ENGLISH', 'MATH', 'SCI-TECH', 'SPECIALIZATION']"
            variant="solo"
            class="mr-10 domain"
            density="compact"
            :style="{ width: '190px' }"
          ></v-select>
        </div>
        <div
          v-if="subject.domain == 'SPECIALIZATION'"
          class="d-flex flex-column"
        >
          <v-label style="margin-bottom: 10px">Strand: </v-label>
          <v-select
            v-model="subject.strand"
            single-line
            label="ABM"
            :items="['STEM', 'ABM', 'HUMMS', 'GAS', 'TVL-ICT', 'TVL-FBS']"
            variant="solo"
            class="domain"
            density="compact"
            :style="{ width: '180px' }"
          ></v-select>
        </div>
      </div>
      <v-divider></v-divider>
      <div class="d-flex">
        <div class="d-flex flex-column">
          <v-label style="margin-bottom: 10px">Semester: </v-label>
          <v-select
            v-model="subject.semester"
            single-line
            :items="['First Semester', 'Second Semester']"
            variant="solo"
            class="mr-10 domain"
            density="compact"
            :style="{ width: '190px' }"
          ></v-select>
        </div>
        <div class="d-flex flex-column">
          <v-label style="margin-bottom: 10px">No. of Unit: </v-label>
          <v-text-field
            v-model="subject.unit"
            prepend-outer-icon="mdi-account"
            required
            class="unit"
            variant="outlined"
            single-line
            density="compact"
            :style="{ width: '150px' }"
          ></v-text-field>
        </div>
      </div>
    </div>
    <div class="d-flex justify-end mr-7 gap-5">
      <v-btn @click="closeForm">CANCEL</v-btn>
      <v-btn @click="saveSubject">{{
        subjectToUpdate == null ? "ADD SUBJECT" : "UPDATE SUBJECT"
      }}</v-btn>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  props: {
    subjectToUpdate: Object,
  },
  data() {
    return {
      formTitle: "SUBJECT CREATION",
      subject: {
        id: null,
        name: "",
        type: null,
        lvl: 11,
        domain: null,
        strand: null,
        semester: "First Semester",
        unit: 3,
      },
    };
  },
  mounted() {
    this.changeToEditForm();
  },
  methods: {
    changeToEditForm() {
      if (this.subjectToUpdate != null) {
        this.formTitle = "EDIT SUBJECT FORM";
        this.subject = {
          id: this.subjectToUpdate.subject_id,
          name: this.subjectToUpdate.subject_name || "",
          type: this.subjectToUpdate.subject_type || null,
          lvl: this.subjectToUpdate.subject_lvl || 11,
          domain: this.subjectToUpdate.domain_name || null,
          strand: this.subjectToUpdate.strand_name || null,
          semester:
            this.subjectToUpdate.semester == 2
              ? "Second Semester"
              : "First Semester",
          unit: this.subjectToUpdate.unit || 3,
        };
      }
    },
    saveSubject() {
      const data = {
        insertSubject: true,
        id: this.subject.id,
        name: this.subject.name,
        type:
          this.subject.domain != "SPECIALIZATION" ? "General" : "Specialized",
        lvl: this.subject.lvl,
        domain: this.subject.domain,
        strand: this.subject.strand,
        semester: this.subject.semester == "First Semester" ? "1" : "2",
        unit: this.subject.unit,
      };

      axios
        .post("http://localhost:3000/src/database/subject.php", data)
        .then((response) => {
          console.log(response.data);
          if (data.id != null) {
            alert("SUBJECT " + data.name + " IS SUCCESSFULLY UPDATED");
          } else {
            alert("SUBJECT " + data.name + " IS SUCCESSFULLY ADDED");
          }

          this.$router.go(0);
        })
        .catch((error) => {
          console.error("There was an error!", error);
        });
    },
    closeForm() {
      this.$emit("close-form");
    },
  },
};
</script>

<style scoped>
h3 {
  color: rgb(159, 53, 53);
}
.form-container {
  height: 75vh;
  width: 600px;
  background: rgb(255, 255, 255);
  box-shadow: 3px 1px 20px 3px rgb(230, 230, 230);
}
.radio-group {
  max-width: fit-content;
}
.form-title {
  background: rgb(236, 70, 70);
  height: 60px;
  color: white;
}
</style>
