set(DATA botserv.conf hostserv.conf operserv.conf chanserv.conf global.conf memoserv.conf nickserv.conf services.conf)
install(FILES ${DATA}
  DESTINATION ${CONF_DIR}
)
