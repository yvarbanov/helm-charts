{{/*
Helper template file to improve variable naming in templates.
*/}}

{{- define "mariadb.shortname" }}
{{-   printf "%s-%s" .Release.Name "mariadb" }}
{{- end }}

{{- define "mariadb.fullname" }}
{{-   printf "%s-%s-v%s" .Release.Name "mariadb" .Chart.Version }}
{{- end }}

{{- define "mariadb.deployment.name" }}
{{-   printf "%s-deployment" (include "mariadb.shortname" .) }}
{{- end }}

{{- define "mariadb.service.name" }}
{{-   printf "%s-service" (include "mariadb.shortname" .) }}
{{- end }}

{{- define "mariadb.secret.name" }}
{{-   printf "%s-secret" (include "mariadb.shortname" .) }}
{{- end }}

{{- define "mariadb.route.name" }}
{{-   printf "%s-route" (include "mariadb.shortname" .) }}
{{- end }}

{{- define "mariadb.pvc.name" }}
{{-   printf "%s-pvc" (include "mariadb.shortname" .) }}
{{- end }}

{{- define "mariadb.store.name" }}
{{-   printf "%s-store" (include "mariadb.shortname" .) }}
{{- end }}