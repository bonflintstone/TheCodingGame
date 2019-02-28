<template>
  <v-navigation-drawer app fixed temporary v-model="drawerOpen">
    <v-list>
      <v-list-tile>
        <v-list-tile-title>
          Select Level
        </v-list-tile-title>
      </v-list-tile>
      <v-list-tile
        exact
        v-for="level in levels"
        :to="`${level.id}`"
        :key="level.id"
      >
        {{ level.name }}
      </v-list-tile>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { getLevels } from '../services/api'

export default {
  props: {
    value: Boolean
  },
  data: () => ({
    levels: []
  }),
  computed: {
    drawerOpen: {
      get() {
        return this.value
      },
      set(value) {
        this.$emit('input', value)
      }
    }
  },
  mounted() {
    getLevels().then(levels => (this.levels = levels))
  }
}
</script>
