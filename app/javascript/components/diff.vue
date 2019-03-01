<template>
  <v-card v-html="diffHtml" />
</template>

<script>
import { createTwoFilesPatch } from 'diff'
import { Diff2Html } from 'diff2html'
import 'diff2html/dist/diff2html.min.css'

export default {
  props: {
    source1: String,
    source2: String
  },
  computed: {
    diff() {
      return createTwoFilesPatch('Before', 'After', this.source1, this.source2)
    },
    diffHtml() {
      return Diff2Html.getPrettyHtml(this.diff, {
        inputFormat: 'diff',
        showFiles: false,
        matching: 'lines',
        outputFormat: 'side-by-side'
      })
    }
  }
}
</script>
