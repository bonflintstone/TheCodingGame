<template>
  <Level v-if="level" :level="level" />
  <h2 v-else>Loading</h2>
</template>

<script>
import Level from './level'

import { getLevel } from '../services/api'

export default {
  components: { Level },
  computed: {
    levelNumber() {
      return this.$route.params.levelNumber
    }
  },
  data: () => ({
    level: null,
    currentStage: {}
  }),
  watch: {
    levelNumber: {
      immediate: true,
      handler() {
        getLevel(this.levelNumber).then(level => (this.level = level))
      }
    }
  }
}
</script>
