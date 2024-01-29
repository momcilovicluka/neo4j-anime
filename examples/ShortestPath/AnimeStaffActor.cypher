//AnimeStaffActor
CALL gds.graph.project(
    'AnimeStaffVoiceActor',
    ['Anime', 'Staff', 'VoiceActor'],
    {
    relType: {
      type: '*',
      orientation: 'UNDIRECTED',
      properties: {}
    }
  },
    {});