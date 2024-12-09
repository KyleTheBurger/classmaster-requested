<template>
  <v-card color="gray-lighten-2" height="750px" rounded="0" flat>
      <!-- Toolbar -->
  <ClassSectioning/>
   </v-card>
</template>

<script>
import ClassSectioning from '../components/ClassSectioning.vue'
export default {
  components: {
      ClassSectioning
  }
}
</script>

<style scoped>
.material-symbols-outlined {
  font-family: "Material Symbols Outlined", sans-serif;
  font-variation-settings: "FILL" 0, "wght" 400, "GRAD" 0, "opsz" 24;
}
.head{
  background-color: #ffffff;
  color: rgb(86, 85, 85);
  font-size: 25px !important;
  font-weight: bold;
  border-bottom: solid 3px rgb(99, 20, 20);
}

.v-toolbar-title {
  color: rgb(86, 85, 85);
  font-size: 25px !important;
  font-weight: bold;
}
</style>