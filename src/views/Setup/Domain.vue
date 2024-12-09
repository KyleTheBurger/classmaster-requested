<template>
  <div class="container">
    <h3 style="text-align: center; margin-top: 20px">DOMAIN LIST</h3>
    <div class="d-flex mt-5 table-form">
      <Table :domainList="domains" @updateDescription="onUpdateDescription" />
      <div class="form-container">
        <div v-if="!editForm" class="d-flex justify-center align-center title">
          CREATE DOMAIN
        </div>
        <div v-if="editForm" class="d-flex justify-center align-center title">
          EDIT DOMAIN DESCRIPTION
        </div>
        <div class="form">
          <v-label style="margin-bottom: 10px">Domain Name</v-label>
          <v-text-field
            v-model="domainForm.domain_name"
            label="Enter Domain Name here"
            required
            class="domain"
            variant="outlined"
            single-line
            density="compact"
            :disabled="editForm"
            :style="{ width: '300px' }"
          ></v-text-field>
          <v-label style="margin-bottom: 10px">Description: </v-label>
          <v-textarea
            v-model="domainForm.description"
            label="Description"
            variant="outlined"
            no-resize
            :rules="rules"
            single-line
          ></v-textarea>

          <!-- Button -->
          <div class="d-flex justify-end gap-4 mt-3 buttons">
            <v-btn v-if="!editForm" variant="compact" @click="clearForm"
              >CLEAR</v-btn
            >
            <v-btn v-if="editForm" variant="compact" @click="cancelEditForm"
              >CANCEL</v-btn
            >
            <v-btn variant="compact" @click="saveDomain"
              ><span v-if="!editForm"> ADD</span>
              <span v-if="editForm"> SAVE</span>
            </v-btn>
          </div>
        </div>
      </div>
    </div>
    <div class="mt-5 footer">
      <span>
        These are the categories that students and Learning Facilitator in
        senior high school will focus on. Within each domain, there are specific
        subjects <br />
        that they will take.
      </span>
      <router-link :to="{ name: 'subjectCreation' }" class="ml-2 footer-link">
        Go to Subject Page
      </router-link>
    </div>
  </div>
</template>
<script>
import Table from "@/components/domain/Table.vue";
import axios from "axios";
//import ImageSlider from "@/components/cohortloading/ImageSlider.vue";
export default {
  data() {
    return {
      editForm: false,
      domainForm: {
        domain_id: "",
        domain_name: "",
        description: "",
      },
      domains: [],
      rules: [(v) => v.length <= 500 || "Max 300 characters"],
    };
  },
  components: {
    Table,
  },
  mounted() {
    this.fetchDomains();
  },
  methods: {
    fetchDomains() {
      axios
        .get(`http://localhost:3000/src/database/domain.php`)
        .then((response) => {
          this.domains = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    saveDomain() {
      const data = {
        insertUpdateDomain: true,
        domain_id: this.domainForm.domain_id,
        domain_name: this.domainForm.domain_name,
        description: this.domainForm.description,
      };
      console.log(data);
      axios
        .post("http://localhost:3000/src/database/domain.php", data)
        .then((response) => {
          console.log(response.data);
          if (this.editForm) {
            alert("DOMAIN IS SUCCESSFULLY UPDATED");
          } else {
            alert("DOMAIN IS SUCCESSFULLY ADDED");
          }
          this.$router.go(0);
        })
        .catch((error) => {
          console.error("There was an error!", error);
        });
    },
    onUpdateDescription(item) {
      this.domainForm.domain_id = item.domain_id;
      this.domainForm.domain_name = item.domain_name;
      this.domainForm.description = item.description;
      this.editForm = true;
    },
    clearForm() {
      this.domainForm.domain_name = "";
      this.domainForm.description = "";
    },
    cancelEditForm() {
      this.editForm = false;
      this.clearForm();
    },
  },
};
</script>
<style scoped>
.form-container {
  display: flex;
  flex-direction: column;
  height: 65vh;
  margin: 0px 0px 0px 40px;
  width: 30%;
  background: rgb(255, 255, 255);
  box-shadow: 3px 3px 20px 2px rgb(195, 193, 193);
}
.form {
  padding: 20px 30px;
}
.form-container .title {
  color: rgb(255, 255, 255);
  background: rgb(226, 96, 96);
  width: 100%;
  height: 50px;
  letter-spacing: 2px;
}
.footer-link {
  text-decoration: none;
  color: rgb(201, 93, 93);
  transition: 0.2s ease-in-out;
}
.footer-link:hover {
  font-size: 16.6px;
  font-weight: 500;
}
.footer {
  text-align: center;
}
</style>
