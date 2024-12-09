<template>
  <div class="container">
    <div class="mt-5 subject-filter">
      <SubjectFilter @handleSubjectTable="handleFilterTable" />
    </div>
    <div class="subject-table">
      <SubjectTable
        :showForm="!showForm && !showEditForm"
        :otherDetail="otherDetail"
        :subjects="subjects"
        @updateSubjectInfo="openEditForm"
      />
    </div>
    <div class="d-flex justify-end mt-7 buttons">
      <v-btn color="rgba(67, 189, 94, 1)" @click="showForm = true">
        <span class="material-symbols-outlined"> add_circle </span>ADD SUBJECT
      </v-btn>
    </div>
  </div>
  <div v-if="showForm || showEditForm" class="subject-form">
    <SubjectForm
      @close-form="closeForm"
      :showEditForm="showEditForm"
      :subjectToUpdate="subjectToUpdate"
    />
  </div>
</template>
<script>
import axios from "axios";
import SubjectTable from "@/components/subject-creation/SubjectTable.vue";
import SubjectFilter from "@/components/subject-creation/SubjectFilter.vue";
import SubjectForm from "@/components/subject-creation/SubjectForm.vue";
export default {
  data() {
    return {
      otherDetail: false,
      subjects: [],
      showEditForm: false,
      subjectToUpdate: null,
      showForm: false,
    };
  },
  components: {
    SubjectTable,
    SubjectFilter,
    SubjectForm,
  },
  mounted() {
    this.fetchSubjectList();
  },
  methods: {
    closeForm() {
      this.showEditForm = false;
      this.showForm = false;
      this.subjectToUpdate = null;
    },
    openEditForm(item) {
      this.showEditForm = true;
      this.subjectToUpdate = item;
    },
    fetchSubjectList() {
      axios
        .get(`http://localhost:3000/src/database/subject.php`)
        .then((response) => {
          this.subjects = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    handleFilterTable(filter) {
      console.log("it execute");
      this.otherDetail = filter.otherDetail;
      axios
        .get("http://localhost:3000/src/database/subject.php", {
          params: {
            filterSubjectTable: true,
            domain: filter.domain,
            lvl: filter.subject_lvl,
            name: filter.search,
          },
        })
        .then((response) => {
          this.subjects = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>

<style scoped>
.subject-form {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
