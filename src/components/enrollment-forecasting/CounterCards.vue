<script setup>
import { defineProps } from "vue";

const props = defineProps({
	cardTitle: String,
	cardValue: String,
	cardColor: String,
});
</script>

<template>
	<div class="counter-card">
		<h2 class="card-title">
			{{ props.cardTitle }}
		</h2>
		<span class="card-value">
			{{ props.cardValue }}
		</span>
	</div>
</template>
