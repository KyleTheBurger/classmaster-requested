<script setup>
import { watchEffect } from "vue";
import { ref, onMounted } from "vue";

const props = defineProps({
	isMain: {
		type: Boolean,
		default: false,
	},
	label: {
		type: String,
		default: "enrollees",
	},
	value: {
		type: Number,
		default: 800,
	},
	icon: {
		type: String,
		default: "mdi-information-outline",
	},
	readonly: {
		type: Boolean,
		default: false,
	},
	updateHandler: {
		type: Function,
		default: (val) => {},
	},
});

const isEditing = ref(false);

const toggleEdit = () => {
	isEditing.value = !isEditing;
	console.log("toggled");
};

onMounted(async () => {});
</script>

<template>
	<div class="d-flex justify-start align-center ga-4 ress stat">
		<v-icon v-if="isMain" class="icon" :icon="icon" size="48"></v-icon>
		<v-icon v-else class="icon" :icon="icon" size="32"></v-icon>
		<form class="d-flex flex-column ga-1">
			<span v-if="!isEditing">{{ props.value }} </span>
			<v-input
				type="number"
				v-else
				model-view="props.value"
				hide-spinnerbox
			/>
			<div class="d-flex justify-end align-center">
				<p>{{ props.label }}</p>
				<v-btn
					v-if="isEditing.value"
					icon="mdi-content-save-outline"
					variant="plain"
					density="comfortable"
					size="small"
					dense="compact"
					@click="toggleEdit"
				></v-btn>
				<v-btn
					v-if="isEditing"
					icon="mdi-close"
					variant="plain"
					density="comfortable"
					size="small"
					dense="compact"
					@click="toggleEdit"
				></v-btn>
			</div>
		</form>
		<v-btn
			v-if="!readonly && !isEditing"
			icon="mdi-pencil"
			variant="plain"
			density="comfortable"
		></v-btn>
	</div>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200..800;1,200..800&display=swap");

.stat {
	width: 100%;
	font-family: "Karla", serif;
	font-optical-sizing: auto;
	font-size: 16px;
	line-height: 1;
	padding: 1rem;
}

span {
	font-size: 32px;
	line-height: 0.7;
}

p {
	margin: 0;
}

.main {
	span {
		font-size: 48px;
		line-height: 0.7;
	}
}
</style>
