<template>
  <v-card v-html="diffHtml" />
</template>

<script>
import { createTwoFilesPatch } from 'diff'
import { Diff2Html } from 'diff2html'
import 'diff2html/dist/diff2html.min.css'

export default {
  props: {
    fileName1: String,
    fileName2: String,
    source1: String,
    source2: String,
    unified: Boolean
  },
  computed: {
    diff() {
      return createTwoFilesPatch(
        this.fileName1,
        this.fileName2,
        this.source1,
        this.source2,
        null,
        null,
        {
          context: 999999
        }
      )
    },
    diffHtml() {
      return Diff2Html.getPrettyHtml(this.diff, {
        inputFormat: 'diff',
        matching: 'lines',
        outputFormat: this.unified ? 'line-by-line' : 'side-by-side'
      })
    }
  }
}
</script>
