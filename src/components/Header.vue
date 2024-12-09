<template>
  <v-toolbar density="comfortable" :title="title">
    <div class="d-flex gap-5 mr-15">
      <router-link
        v-for="page in currentPages"
        :key="page.page_name"
        :to="{ name: page.router_name }"
        :class="{ 'active-link': $route.name === page.router_name }"
      >
        {{ page.page_name }}
      </router-link>
    </div>
  </v-toolbar>
</template>

<script>
export default {
  props: {
    title: String,
  },
  data() {
    return {
      pages: {
        "Setup and Initialization": [
          { page_name: "Domain", router_name: "domain" },
          { page_name: "Strand", router_name: "strand" },
          { page_name: "Room", router_name: "room" },
        ],
        Registration: [
          {
            page_name: "Faculty Registration",
            router_name: "facultyRegistration",
          },
          {
            page_name: "Student Registration",
            router_name: "studentRegistration",
          },
          { page_name: "Subject Creation", router_name: "subjectCreation" },
        ],
        "Section and Cohort Management": [
          { page_name: "Section", router_name: "section" },
          { page_name: "Cohort", router_name: "cohort" },
        ],
      },
    };
  },
  computed: {
    currentPages() {
      return this.pages[this.title] || [];
    },
  },
};
</script>

<style scoped>
.v-toolbar {
  color: white;
  background: rgb(230, 72, 72);
}
a {
  font-weight: 450;
  color: #dedede;
  text-decoration: none;
  font-size: 17px;
  width: 160px;
  transition: 0.2s ease-in-out;
}

a.router-link-exact-active {
  color: #ffffff;
}

a:hover {
  font-size: 17.1px;
  font-weight: 550;
}
</style>
