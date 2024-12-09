<template>
  <div class="container"></div>
</template>

<script>
export default {
  data() {
    return {
      domains: [
        {
          name: "ENGLISH",
          description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed dapibus enim. Vivamus elementum efficitur leo eget faucibus. Quisque tortor ligula, luctus ut porta sodales, pharetra non dolor. Donec varius laoreet facilisis. Praesent consectetur massa nulla, a cursus augue pulvinar non.",
          picture: "english.jpg",
        },
        {
          name: "MATH",
          description: "",
          picture: "Math.jpg",
        },
        {
          name: "SCI-TECH",
          description: "",
          picture: "SciTech.jpg",
        },
        {
          name: "SPECIALIZATION",
          description: "",
          picture: "",
        },
      ],
    };
  },
  methods: {
    getSrc(pic) {
      return "@/assets/" + pic;
    },
  },
};
</script>

<style scope>
.content {
  padding: 150px;
}
</style>
