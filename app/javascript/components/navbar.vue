<template>
  <div>
    <v-toolbar>
      <v-toolbar-title>
        The Game
      </v-toolbar-title>

      <v-btn to="/">
        Menu
      </v-btn>

      <v-spacer />

      <v-btn href="/logout">
        Logout
      </v-btn>
    </v-toolbar>
  </div>
</template>

<script>
export default {
  props: {
    value: Boolean
  },
  data: () => ({
    drawerOpen: false
  })
}
</script>
