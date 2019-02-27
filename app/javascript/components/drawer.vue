<template>
  <v-navigation-drawer app fixed temporary v-model="drawerOpen">
    <v-list>
      <v-list-tile>
        <v-list-tile-title>
          Select Level
        </v-list-tile-title>
      </v-list-tile>
      <v-list-tile exact to="1">
        1
      </v-list-tile>
      <v-list-tile exact to="2">
        2
      </v-list-tile>
      <v-list-tile exact to="3">
        3
      </v-list-tile>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  props: {
    value: Boolean
  },
  computed: {
    drawerOpen: {
      get() {
        return this.value
      },
      set(value) {
        this.$emit('input', value)
      }
    }
  }
}
</script>
