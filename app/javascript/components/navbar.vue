<template>
  <div>
    <Drawer v-model="drawerOpen" />
    <v-toolbar>
      <v-toolbar-side-icon @click="() => (drawerOpen = true)" />
      <v-toolbar-title>
        The Game
      </v-toolbar-title>
    </v-toolbar>
  </div>
</template>

<script>
import Drawer from './drawer'

export default {
  components: { Drawer },
  props: {
    value: Boolean
  },
  data: () => ({
    drawerOpen: false
  })
}
</script>
