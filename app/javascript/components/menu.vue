<template>
  <v-card>
    <v-card-text v-if="!loading">
      <template v-if="status.levelNumber == null">
        <p>{{ status.gameIntroMessage }}</p>
        <v-btn :to="`/levels/${status.levelNumber.id}`">
          Get started with the first level!
        </v-btn>
      </template>

      <template v-if="status.stepNumber != null">
        You still got work todo in level

        <v-btn :to="`/levels/${status.levelNumber}`">
          {{ status.levelNumber.name }}
        </v-btn>
      </template>

      <template v-if="status.stepNumber == null">
        Get started with level
        <v-btn :to="`/levels/${status.levelNumber}`">
          {{ status.levelNumber.name }}
        </v-btn>
      </template>
    </v-card-text>
  </v-card>
</template>

<script>
import { getLevels, getStatus } from '../services/api'

export default {
  data: () => ({
    levels: [],
    status: {},
    loading: true
  }),
  mounted() {
    Promise.all(getStatus, getLevels)
      .then((statusData, levelsData) => {
        this.status = statusData.status
        this.levels = levelsData.levels
      })
      .then(() => (this.loading = false))
  }
}
</script>
