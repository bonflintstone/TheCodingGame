<template>
  <v-app light>
    <Navbar />
    <div style="width: 1200px; max-width: 100%; margin: 10px auto">
      <router-view />
    </div>
  </v-app>
</template>

<script>
import Navbar from './components/navbar'

export default {
  components: { Navbar }
}
</script>
