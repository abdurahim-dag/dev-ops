{{/*
Expand the name of the chart.
*/}}
{{- define "sausage-store-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sausage-store-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sausage-store-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sausage-store-chart.labels" -}}
helm.sh/chart: {{ include "sausage-store-chart.chart" . }}
{{ include "sausage-store-chart.selectorLabels" . }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.version }}
app.kubernetes.io/part-of: sausage-store
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sausage-store-chart.selectorLabels" -}}
app: {{ include "sausage-store-chart.name" . }}
app.kubernetes.io/name: {{ include "sausage-store-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sausage-store-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sausage-store-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Volume mounts
*/}}
{{- define "frontend.volumeMounts" -}}
{{- range .Values.volumes -}}
- name: {{ .name }}
  mountPath: {{ .mountPath }}
  subPath: {{ .subPath }}
  readOnly: {{ .readOnly | default true }}
{{- end }}
{{- end }}

{{/*
Volumes
*/}}
{{- define "frontend.volumes" -}}
{{- range .Values.volumes -}}
- name: {{ .name }}
  configMap:
    name: {{ .configMap.name }}
    items:
    - key: {{ (index .configMap.items 0).key }}
      path: {{ (index .configMap.items 0).path }}
{{- end }}
{{- end }}

{{/*
Rules for ingress
*/}}
{{- define "frontend.ingressRules" -}}
- host: "{{ .Values.ingress.host }}"
  http:
    paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: {{ include "sausage-store-chart.name" . }}
            port:
              number: {{ .Values.ingress.number }}
{{- end }}
