export const getLevels = () =>
  fetch('/api/levels').then(response => response.json())

export const getLevel = id =>
  fetch(`/api/levels/${id}`).then(response => response.json())

export const getStatus = () =>
  fetch('/api/status').then(response => response.json())
