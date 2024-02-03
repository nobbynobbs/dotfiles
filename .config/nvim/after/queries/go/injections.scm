; extends

;; sql 1
(
 (interpreted_string_literal) @sql
 (#match? @sql "^\"([Ss][Ee][Ll][Ee][Cc][Tt]|[[Ii][Nn][Ss][Ee][Rr][Tt]|[Dd][Ee][Ll][Ee][Tt][Ee]|[Uu][Pp][Dd][Aa][Tt][Ee]).+\"$")
 (#offset! @sql 0 1 0 -1)
)

;; sql 2
(
 (raw_string_literal) @sql
 (#match? @sql "^`([Ss][Ee][Ll][Ee][Cc][Tt]|[[Ii][Nn][Ss][Ee][Rr][Tt]|[Dd][Ee][Ll][Ee][Tt][Ee]|[Uu][Pp][Dd][Aa][Tt][Ee]).+\`$")
 (#offset! @sql 0 1 0 -1)
)

