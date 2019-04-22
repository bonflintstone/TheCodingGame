<template>
  <Level v-if="level" :level="level" />
  <h2 v-else>
    Loading
  </h2>
</template>

<script>
import Level from './level'

import { getLevel } from '../services/api'

export default {
  components: { Level },
  data: () => ({
    level: null,
    currentStage: {}
  }),
  computed: {
    levelNumber() {
      return this.$route.params.levelNumber
    }
  },
  watch: {
    levelNumber: {
      immediate: true,
      handler() {
        getLevel(this.levelNumber).then(
          response => (this.level = response.level)
        )
      }
    }
  }
}
</script>
