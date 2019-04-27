<template>
  <v-app light>
    <Navbar />
    <router-view />
  </v-app>
</template>

<script>
import Navbar from './components/navbar'

export default {
  components: { Navbar }
}
</script>
