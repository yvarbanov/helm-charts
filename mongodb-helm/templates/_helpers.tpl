{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mongodb-helm.name" -}}
{{-   default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mongodb-helm.fullname" -}}
{{-   $name := default .Chart.Name .Release.Name }}
{{-   if contains $name .Release.Name }}
{{-     .Release.Name | trunc 63 | trimSuffix "-" }}
{{-   else }}
{{-     printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{-   end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mongodb-helm.chart" -}}
{{-   printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mongodb-helm.labels" -}}
helm.sh/chart: {{ include "mongodb-helm.chart" . }}
{{   include "mongodb-helm.selectorLabels" . }}
{{-  if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{-   end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mongodb-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mongodb-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the ServiceAccountName to use
*/}}
{{- define "mongodb-helm.ServiceAccountName" -}}
{{-   if .Values.serviceAccount }}
{{-     printf "%s-%s" .Release.Name "mongodb-service-account" | trunc 63 | trimSuffix "-" }}
{{-   end }}
{{- end }}
