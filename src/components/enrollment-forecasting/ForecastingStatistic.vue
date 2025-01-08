<script setup>
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
		default: (newVal) => {},
	},
	deleteHandler: {
		type: Function,
		default: () => {},
	},
});

const deleteCheck = ref(false);

onMounted(async () => {});
</script>

<template>
	<form class="d-flex px-5 py-1 align-center ga-1">
		<v-number-input
			:class="[props.isMain ? 'main' : '']"
			type="number"
			:label="deleteCheck ? 'Delete ' + label + '?' : label"
			:prepend-icon="icon"
			variant="underlined"
			v-model="props.value"
			@update:model-value="updateHandler"
			hide-spin-buttons
			:readonly="readonly"
		></v-number-input>
		<v-btn
			v-if="!deleteCheck && !isMain"
			icon="mdi-delete-empty-outline"
			variant="text"
			density="compact"
			@click="deleteCheck = true"
		></v-btn>
		<v-btn
			v-if="deleteCheck"
			icon="mdi-check"
			variant="default"
			density="compact"
			color="error"
			@click="
				() => {
					deleteHandler();
				}
			"
		></v-btn>
		<v-btn
			v-if="deleteCheck"
			icon="mdi-close"
			color="success"
			variant="tonal"
			density="compact"
			@click="deleteCheck = false"
		></v-btn>
	</form>
</template>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Karla:ital,wght@0,200..800;1,200..800&display=swap");

.stat {
	font-family: "Karla", serif;
	font-optical-sizing: auto;
	font-size: 16px;
	line-height: 1;
}

span,
input {
	font-size: 32px;
	line-height: 0.7;
	width: min-content;
	display: inline-block;
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
.v-text-field >>> input {
	font-family: "Karla", serif;
	font-size: 32px;
	font-weight: 400;
	padding: 0;
	margin-top: 0.8rem;
	margin-bottom: 0rem;
	min-width: max-content;
}

.v-text-field.main >>> input {
	font-weight: 700;
	font-size: 48px;
	line-height: 1;
}

.v-text-field >>> label {
	font-family: "Karla", serif;
	font-size: 0.8em;
	line-height: 1;
}

.v-text-field.main >>> label {
	font-family: "Karla", serif;
	font-size: 1em;
}

.v-text-field >>> i {
	font-size: 32px;
}

.v-text-field >>> .v-number-input__control {
	display: none;
}
</style>
