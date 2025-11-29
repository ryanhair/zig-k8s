// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


pub const AWSElasticBlockStoreVolumeSource = struct {
    fsType: ?[]const u8 = null,
    partition: ?i64 = null,
    readOnly: ?bool = null,
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Affinity = struct {
    nodeAffinity: ?root.io.k8s.api.core.v1.NodeAffinity = null,
    podAffinity: ?root.io.k8s.api.core.v1.PodAffinity = null,
    podAntiAffinity: ?root.io.k8s.api.core.v1.PodAntiAffinity = null,

    pub fn validate(self: @This()) !void {
        if (self.nodeAffinity) |v| try v.validate();
        if (self.podAffinity) |v| try v.validate();
        if (self.podAntiAffinity) |v| try v.validate();
    }
};

pub const AppArmorProfile = struct {
    localhostProfile: ?[]const u8 = null,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const AttachedVolume = struct {
    devicePath: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const AzureDiskVolumeSource = struct {
    cachingMode: ?[]const u8 = null,
    diskName: []const u8,
    diskURI: []const u8,
    fsType: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const AzureFilePersistentVolumeSource = struct {
    readOnly: ?bool = null,
    secretName: []const u8,
    secretNamespace: ?[]const u8 = null,
    shareName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const AzureFileVolumeSource = struct {
    readOnly: ?bool = null,
    secretName: []const u8,
    shareName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Binding = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    target: root.io.k8s.api.core.v1.ObjectReference,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.target.validate();
    }
};

pub const CSIPersistentVolumeSource = struct {
    controllerExpandSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    controllerPublishSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    driver: []const u8,
    fsType: ?[]const u8 = null,
    nodeExpandSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    nodePublishSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    nodeStageSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    readOnly: ?bool = null,
    volumeAttributes: ?std.json.Value = null,
    volumeHandle: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.controllerExpandSecretRef) |v| try v.validate();
        if (self.controllerPublishSecretRef) |v| try v.validate();
        if (self.nodeExpandSecretRef) |v| try v.validate();
        if (self.nodePublishSecretRef) |v| try v.validate();
        if (self.nodeStageSecretRef) |v| try v.validate();
    }
};

pub const CSIVolumeSource = struct {
    driver: []const u8,
    fsType: ?[]const u8 = null,
    nodePublishSecretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    readOnly: ?bool = null,
    volumeAttributes: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.nodePublishSecretRef) |v| try v.validate();
    }
};

pub const Capabilities = struct {
    add: ?[]const []const u8 = null,
    drop: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CephFSPersistentVolumeSource = struct {
    monitors: []const []const u8,
    path: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretFile: ?[]const u8 = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const CephFSVolumeSource = struct {
    monitors: []const []const u8,
    path: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretFile: ?[]const u8 = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const CinderPersistentVolumeSource = struct {
    fsType: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const CinderVolumeSource = struct {
    fsType: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const ClientIPConfig = struct {
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ClusterTrustBundleProjection = struct {
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    name: ?[]const u8 = null,
    optional: ?bool = null,
    path: []const u8,
    signerName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
    }
};

pub const ComponentCondition = struct {
    @"error": ?[]const u8 = null,
    message: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ComponentStatus = struct {
    apiVersion: ?[]const u8 = null,
    conditions: ?[]const root.io.k8s.api.core.v1.ComponentCondition = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ComponentStatusList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.ComponentStatus,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ConfigMap = struct {
    apiVersion: ?[]const u8 = null,
    binaryData: ?std.json.Value = null,
    data: ?std.json.Value = null,
    immutable: ?bool = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const ConfigMapEnvSource = struct {
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ConfigMapKeySelector = struct {
    key: []const u8,
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ConfigMapList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.ConfigMap,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ConfigMapNodeConfigSource = struct {
    kubeletConfigKey: []const u8,
    name: []const u8,
    namespace: []const u8,
    resourceVersion: ?[]const u8 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ConfigMapProjection = struct {
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const ConfigMapVolumeSource = struct {
    defaultMode: ?i64 = null,
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const Container = struct {
    args: ?[]const []const u8 = null,
    command: ?[]const []const u8 = null,
    env: ?[]const root.io.k8s.api.core.v1.EnvVar = null,
    envFrom: ?[]const root.io.k8s.api.core.v1.EnvFromSource = null,
    image: ?[]const u8 = null,
    imagePullPolicy: ?[]const u8 = null,
    lifecycle: ?root.io.k8s.api.core.v1.Lifecycle = null,
    livenessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    name: []const u8,
    ports: ?[]const root.io.k8s.api.core.v1.ContainerPort = null,
    readinessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    resizePolicy: ?[]const root.io.k8s.api.core.v1.ContainerResizePolicy = null,
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    restartPolicy: ?[]const u8 = null,
    restartPolicyRules: ?[]const root.io.k8s.api.core.v1.ContainerRestartRule = null,
    securityContext: ?root.io.k8s.api.core.v1.SecurityContext = null,
    startupProbe: ?root.io.k8s.api.core.v1.Probe = null,
    stdin: ?bool = null,
    stdinOnce: ?bool = null,
    terminationMessagePath: ?[]const u8 = null,
    terminationMessagePolicy: ?[]const u8 = null,
    tty: ?bool = null,
    volumeDevices: ?[]const root.io.k8s.api.core.v1.VolumeDevice = null,
    volumeMounts: ?[]const root.io.k8s.api.core.v1.VolumeMount = null,
    workingDir: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.env) |arr| for (arr) |item| try item.validate();
        if (self.envFrom) |arr| for (arr) |item| try item.validate();
        if (self.lifecycle) |v| try v.validate();
        if (self.livenessProbe) |v| try v.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
        if (self.readinessProbe) |v| try v.validate();
        if (self.resizePolicy) |arr| for (arr) |item| try item.validate();
        if (self.resources) |v| try v.validate();
        if (self.restartPolicyRules) |arr| for (arr) |item| try item.validate();
        if (self.securityContext) |v| try v.validate();
        if (self.startupProbe) |v| try v.validate();
        if (self.volumeDevices) |arr| for (arr) |item| try item.validate();
        if (self.volumeMounts) |arr| for (arr) |item| try item.validate();
    }
};

pub const ContainerExtendedResourceRequest = struct {
    containerName: []const u8,
    requestName: []const u8,
    resourceName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerImage = struct {
    names: ?[]const []const u8 = null,
    sizeBytes: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerPort = struct {
    containerPort: i64,
    hostIP: ?[]const u8 = null,
    hostPort: ?i64 = null,
    name: ?[]const u8 = null,
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerResizePolicy = struct {
    resourceName: []const u8,
    restartPolicy: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerRestartRule = struct {
    action: []const u8,
    exitCodes: ?root.io.k8s.api.core.v1.ContainerRestartRuleOnExitCodes = null,

    pub fn validate(self: @This()) !void {
        if (self.exitCodes) |v| try v.validate();
    }
};

pub const ContainerRestartRuleOnExitCodes = struct {
    operator: []const u8,
    values: ?[]const i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerState = struct {
    running: ?root.io.k8s.api.core.v1.ContainerStateRunning = null,
    terminated: ?root.io.k8s.api.core.v1.ContainerStateTerminated = null,
    waiting: ?root.io.k8s.api.core.v1.ContainerStateWaiting = null,

    pub fn validate(self: @This()) !void {
        if (self.running) |v| try v.validate();
        if (self.terminated) |v| try v.validate();
        if (self.waiting) |v| try v.validate();
    }
};

pub const ContainerStateRunning = struct {
    startedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerStateTerminated = struct {
    containerID: ?[]const u8 = null,
    exitCode: i64,
    finishedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    signal: ?i64 = null,
    startedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerStateWaiting = struct {
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ContainerStatus = struct {
    allocatedResources: ?std.json.Value = null,
    allocatedResourcesStatus: ?[]const root.io.k8s.api.core.v1.ResourceStatus = null,
    containerID: ?[]const u8 = null,
    image: []const u8,
    imageID: []const u8,
    lastState: ?root.io.k8s.api.core.v1.ContainerState = null,
    name: []const u8,
    ready: bool,
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    restartCount: i64,
    started: ?bool = null,
    state: ?root.io.k8s.api.core.v1.ContainerState = null,
    stopSignal: ?[]const u8 = null,
    user: ?root.io.k8s.api.core.v1.ContainerUser = null,
    volumeMounts: ?[]const root.io.k8s.api.core.v1.VolumeMountStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.allocatedResourcesStatus) |arr| for (arr) |item| try item.validate();
        if (self.lastState) |v| try v.validate();
        if (self.resources) |v| try v.validate();
        if (self.state) |v| try v.validate();
        if (self.user) |v| try v.validate();
        if (self.volumeMounts) |arr| for (arr) |item| try item.validate();
    }
};

pub const ContainerUser = struct {
    linux: ?root.io.k8s.api.core.v1.LinuxContainerUser = null,

    pub fn validate(self: @This()) !void {
        if (self.linux) |v| try v.validate();
    }
};

pub const DaemonEndpoint = struct {
    port: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const DownwardAPIProjection = struct {
    items: ?[]const root.io.k8s.api.core.v1.DownwardAPIVolumeFile = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const DownwardAPIVolumeFile = struct {
    fieldRef: ?root.io.k8s.api.core.v1.ObjectFieldSelector = null,
    mode: ?i64 = null,
    path: []const u8,
    resourceFieldRef: ?root.io.k8s.api.core.v1.ResourceFieldSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.fieldRef) |v| try v.validate();
        if (self.resourceFieldRef) |v| try v.validate();
    }
};

pub const DownwardAPIVolumeSource = struct {
    defaultMode: ?i64 = null,
    items: ?[]const root.io.k8s.api.core.v1.DownwardAPIVolumeFile = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const EmptyDirVolumeSource = struct {
    medium: ?[]const u8 = null,
    sizeLimit: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const EndpointAddress = struct {
    hostname: ?[]const u8 = null,
    ip: []const u8,
    nodeName: ?[]const u8 = null,
    targetRef: ?root.io.k8s.api.core.v1.ObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.targetRef) |v| try v.validate();
    }
};

pub const EndpointPort = struct {
    appProtocol: ?[]const u8 = null,
    name: ?[]const u8 = null,
    port: i64,
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const EndpointSubset = struct {
    addresses: ?[]const root.io.k8s.api.core.v1.EndpointAddress = null,
    notReadyAddresses: ?[]const root.io.k8s.api.core.v1.EndpointAddress = null,
    ports: ?[]const root.io.k8s.api.core.v1.EndpointPort = null,

    pub fn validate(self: @This()) !void {
        if (self.addresses) |arr| for (arr) |item| try item.validate();
        if (self.notReadyAddresses) |arr| for (arr) |item| try item.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

pub const Endpoints = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    subsets: ?[]const root.io.k8s.api.core.v1.EndpointSubset = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.subsets) |arr| for (arr) |item| try item.validate();
    }
};

pub const EndpointsList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Endpoints,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const EnvFromSource = struct {
    configMapRef: ?root.io.k8s.api.core.v1.ConfigMapEnvSource = null,
    prefix: ?[]const u8 = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretEnvSource = null,

    pub fn validate(self: @This()) !void {
        if (self.configMapRef) |v| try v.validate();
        if (self.secretRef) |v| try v.validate();
    }
};

pub const EnvVar = struct {
    name: []const u8,
    value: ?[]const u8 = null,
    valueFrom: ?root.io.k8s.api.core.v1.EnvVarSource = null,

    pub fn validate(self: @This()) !void {
        if (self.valueFrom) |v| try v.validate();
    }
};

pub const EnvVarSource = struct {
    configMapKeyRef: ?root.io.k8s.api.core.v1.ConfigMapKeySelector = null,
    fieldRef: ?root.io.k8s.api.core.v1.ObjectFieldSelector = null,
    fileKeyRef: ?root.io.k8s.api.core.v1.FileKeySelector = null,
    resourceFieldRef: ?root.io.k8s.api.core.v1.ResourceFieldSelector = null,
    secretKeyRef: ?root.io.k8s.api.core.v1.SecretKeySelector = null,

    pub fn validate(self: @This()) !void {
        if (self.configMapKeyRef) |v| try v.validate();
        if (self.fieldRef) |v| try v.validate();
        if (self.fileKeyRef) |v| try v.validate();
        if (self.resourceFieldRef) |v| try v.validate();
        if (self.secretKeyRef) |v| try v.validate();
    }
};

pub const EphemeralContainer = struct {
    args: ?[]const []const u8 = null,
    command: ?[]const []const u8 = null,
    env: ?[]const root.io.k8s.api.core.v1.EnvVar = null,
    envFrom: ?[]const root.io.k8s.api.core.v1.EnvFromSource = null,
    image: ?[]const u8 = null,
    imagePullPolicy: ?[]const u8 = null,
    lifecycle: ?root.io.k8s.api.core.v1.Lifecycle = null,
    livenessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    name: []const u8,
    ports: ?[]const root.io.k8s.api.core.v1.ContainerPort = null,
    readinessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    resizePolicy: ?[]const root.io.k8s.api.core.v1.ContainerResizePolicy = null,
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    restartPolicy: ?[]const u8 = null,
    restartPolicyRules: ?[]const root.io.k8s.api.core.v1.ContainerRestartRule = null,
    securityContext: ?root.io.k8s.api.core.v1.SecurityContext = null,
    startupProbe: ?root.io.k8s.api.core.v1.Probe = null,
    stdin: ?bool = null,
    stdinOnce: ?bool = null,
    targetContainerName: ?[]const u8 = null,
    terminationMessagePath: ?[]const u8 = null,
    terminationMessagePolicy: ?[]const u8 = null,
    tty: ?bool = null,
    volumeDevices: ?[]const root.io.k8s.api.core.v1.VolumeDevice = null,
    volumeMounts: ?[]const root.io.k8s.api.core.v1.VolumeMount = null,
    workingDir: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.env) |arr| for (arr) |item| try item.validate();
        if (self.envFrom) |arr| for (arr) |item| try item.validate();
        if (self.lifecycle) |v| try v.validate();
        if (self.livenessProbe) |v| try v.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
        if (self.readinessProbe) |v| try v.validate();
        if (self.resizePolicy) |arr| for (arr) |item| try item.validate();
        if (self.resources) |v| try v.validate();
        if (self.restartPolicyRules) |arr| for (arr) |item| try item.validate();
        if (self.securityContext) |v| try v.validate();
        if (self.startupProbe) |v| try v.validate();
        if (self.volumeDevices) |arr| for (arr) |item| try item.validate();
        if (self.volumeMounts) |arr| for (arr) |item| try item.validate();
    }
};

pub const EphemeralVolumeSource = struct {
    volumeClaimTemplate: ?root.io.k8s.api.core.v1.PersistentVolumeClaimTemplate = null,

    pub fn validate(self: @This()) !void {
        if (self.volumeClaimTemplate) |v| try v.validate();
    }
};

pub const Event = struct {
    action: ?[]const u8 = null,
    apiVersion: ?[]const u8 = null,
    count: ?i64 = null,
    eventTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    firstTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    involvedObject: root.io.k8s.api.core.v1.ObjectReference,
    kind: ?[]const u8 = null,
    lastTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    metadata: root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta,
    reason: ?[]const u8 = null,
    related: ?root.io.k8s.api.core.v1.ObjectReference = null,
    reportingComponent: ?[]const u8 = null,
    reportingInstance: ?[]const u8 = null,
    series: ?root.io.k8s.api.core.v1.EventSeries = null,
    source: ?root.io.k8s.api.core.v1.EventSource = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.involvedObject.validate();
        try self.metadata.validate();
        if (self.related) |v| try v.validate();
        if (self.series) |v| try v.validate();
        if (self.source) |v| try v.validate();
    }
};

pub const EventList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Event,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const EventSeries = struct {
    count: ?i64 = null,
    lastObservedTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const EventSource = struct {
    component: ?[]const u8 = null,
    host: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ExecAction = struct {
    command: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FCVolumeSource = struct {
    fsType: ?[]const u8 = null,
    lun: ?i64 = null,
    readOnly: ?bool = null,
    targetWWNs: ?[]const []const u8 = null,
    wwids: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FileKeySelector = struct {
    key: []const u8,
    optional: ?bool = null,
    path: []const u8,
    volumeName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const FlexPersistentVolumeSource = struct {
    driver: []const u8,
    fsType: ?[]const u8 = null,
    options: ?std.json.Value = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const FlexVolumeSource = struct {
    driver: []const u8,
    fsType: ?[]const u8 = null,
    options: ?std.json.Value = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const FlockerVolumeSource = struct {
    datasetName: ?[]const u8 = null,
    datasetUUID: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GCEPersistentDiskVolumeSource = struct {
    fsType: ?[]const u8 = null,
    partition: ?i64 = null,
    pdName: []const u8,
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GRPCAction = struct {
    port: i64,
    service: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GitRepoVolumeSource = struct {
    directory: ?[]const u8 = null,
    repository: []const u8,
    revision: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GlusterfsPersistentVolumeSource = struct {
    endpoints: []const u8,
    endpointsNamespace: ?[]const u8 = null,
    path: []const u8,
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const GlusterfsVolumeSource = struct {
    endpoints: []const u8,
    path: []const u8,
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HTTPGetAction = struct {
    host: ?[]const u8 = null,
    httpHeaders: ?[]const root.io.k8s.api.core.v1.HTTPHeader = null,
    path: ?[]const u8 = null,
    port: root.io.k8s.apimachinery.pkg.util.intstr.IntOrString,
    scheme: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.httpHeaders) |arr| for (arr) |item| try item.validate();
    }
};

pub const HTTPHeader = struct {
    name: []const u8,
    value: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HostAlias = struct {
    hostnames: ?[]const []const u8 = null,
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HostIP = struct {
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const HostPathVolumeSource = struct {
    path: []const u8,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ISCSIPersistentVolumeSource = struct {
    chapAuthDiscovery: ?bool = null,
    chapAuthSession: ?bool = null,
    fsType: ?[]const u8 = null,
    initiatorName: ?[]const u8 = null,
    iqn: []const u8,
    iscsiInterface: ?[]const u8 = null,
    lun: i64,
    portals: ?[]const []const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    targetPortal: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const ISCSIVolumeSource = struct {
    chapAuthDiscovery: ?bool = null,
    chapAuthSession: ?bool = null,
    fsType: ?[]const u8 = null,
    initiatorName: ?[]const u8 = null,
    iqn: []const u8,
    iscsiInterface: ?[]const u8 = null,
    lun: i64,
    portals: ?[]const []const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    targetPortal: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const ImageVolumeSource = struct {
    pullPolicy: ?[]const u8 = null,
    reference: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const KeyToPath = struct {
    key: []const u8,
    mode: ?i64 = null,
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Lifecycle = struct {
    postStart: ?root.io.k8s.api.core.v1.LifecycleHandler = null,
    preStop: ?root.io.k8s.api.core.v1.LifecycleHandler = null,
    stopSignal: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.postStart) |v| try v.validate();
        if (self.preStop) |v| try v.validate();
    }
};

pub const LifecycleHandler = struct {
    exec: ?root.io.k8s.api.core.v1.ExecAction = null,
    httpGet: ?root.io.k8s.api.core.v1.HTTPGetAction = null,
    sleep: ?root.io.k8s.api.core.v1.SleepAction = null,
    tcpSocket: ?root.io.k8s.api.core.v1.TCPSocketAction = null,

    pub fn validate(self: @This()) !void {
        if (self.exec) |v| try v.validate();
        if (self.httpGet) |v| try v.validate();
        if (self.sleep) |v| try v.validate();
        if (self.tcpSocket) |v| try v.validate();
    }
};

pub const LimitRange = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.LimitRangeSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const LimitRangeItem = struct {
    default: ?std.json.Value = null,
    defaultRequest: ?std.json.Value = null,
    max: ?std.json.Value = null,
    maxLimitRequestRatio: ?std.json.Value = null,
    min: ?std.json.Value = null,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const LimitRangeList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.LimitRange,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const LimitRangeSpec = struct {
    limits: []const root.io.k8s.api.core.v1.LimitRangeItem,

    pub fn validate(self: @This()) !void {
        for (self.limits) |item| try item.validate();
    }
};

pub const LinuxContainerUser = struct {
    gid: i64,
    supplementalGroups: ?[]const i64 = null,
    uid: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const LoadBalancerIngress = struct {
    hostname: ?[]const u8 = null,
    ip: ?[]const u8 = null,
    ipMode: ?[]const u8 = null,
    ports: ?[]const root.io.k8s.api.core.v1.PortStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

pub const LoadBalancerStatus = struct {
    ingress: ?[]const root.io.k8s.api.core.v1.LoadBalancerIngress = null,

    pub fn validate(self: @This()) !void {
        if (self.ingress) |arr| for (arr) |item| try item.validate();
    }
};

pub const LocalObjectReference = struct {
    name: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const LocalVolumeSource = struct {
    fsType: ?[]const u8 = null,
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ModifyVolumeStatus = struct {
    status: []const u8,
    targetVolumeAttributesClassName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NFSVolumeSource = struct {
    path: []const u8,
    readOnly: ?bool = null,
    server: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Namespace = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.NamespaceSpec = null,
    status: ?root.io.k8s.api.core.v1.NamespaceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const NamespaceCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NamespaceList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Namespace,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const NamespaceSpec = struct {
    finalizers: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NamespaceStatus = struct {
    conditions: ?[]const root.io.k8s.api.core.v1.NamespaceCondition = null,
    phase: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const Node = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.NodeSpec = null,
    status: ?root.io.k8s.api.core.v1.NodeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const NodeAddress = struct {
    address: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeAffinity = struct {
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PreferredSchedulingTerm = null,
    requiredDuringSchedulingIgnoredDuringExecution: ?root.io.k8s.api.core.v1.NodeSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |v| try v.validate();
    }
};

pub const NodeCondition = struct {
    lastHeartbeatTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeConfigSource = struct {
    configMap: ?root.io.k8s.api.core.v1.ConfigMapNodeConfigSource = null,

    pub fn validate(self: @This()) !void {
        if (self.configMap) |v| try v.validate();
    }
};

pub const NodeConfigStatus = struct {
    active: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    assigned: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    @"error": ?[]const u8 = null,
    lastKnownGood: ?root.io.k8s.api.core.v1.NodeConfigSource = null,

    pub fn validate(self: @This()) !void {
        if (self.active) |v| try v.validate();
        if (self.assigned) |v| try v.validate();
        if (self.lastKnownGood) |v| try v.validate();
    }
};

pub const NodeDaemonEndpoints = struct {
    kubeletEndpoint: ?root.io.k8s.api.core.v1.DaemonEndpoint = null,

    pub fn validate(self: @This()) !void {
        if (self.kubeletEndpoint) |v| try v.validate();
    }
};

pub const NodeFeatures = struct {
    supplementalGroupsPolicy: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Node,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const NodeRuntimeHandler = struct {
    features: ?root.io.k8s.api.core.v1.NodeRuntimeHandlerFeatures = null,
    name: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.features) |v| try v.validate();
    }
};

pub const NodeRuntimeHandlerFeatures = struct {
    recursiveReadOnlyMounts: ?bool = null,
    userNamespaces: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeSelector = struct {
    nodeSelectorTerms: []const root.io.k8s.api.core.v1.NodeSelectorTerm,

    pub fn validate(self: @This()) !void {
        for (self.nodeSelectorTerms) |item| try item.validate();
    }
};

pub const NodeSelectorRequirement = struct {
    key: []const u8,
    operator: []const u8,
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeSelectorTerm = struct {
    matchExpressions: ?[]const root.io.k8s.api.core.v1.NodeSelectorRequirement = null,
    matchFields: ?[]const root.io.k8s.api.core.v1.NodeSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchExpressions) |arr| for (arr) |item| try item.validate();
        if (self.matchFields) |arr| for (arr) |item| try item.validate();
    }
};

pub const NodeSpec = struct {
    configSource: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    externalID: ?[]const u8 = null,
    podCIDR: ?[]const u8 = null,
    podCIDRs: ?[]const []const u8 = null,
    providerID: ?[]const u8 = null,
    taints: ?[]const root.io.k8s.api.core.v1.Taint = null,
    unschedulable: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.configSource) |v| try v.validate();
        if (self.taints) |arr| for (arr) |item| try item.validate();
    }
};

pub const NodeStatus = struct {
    addresses: ?[]const root.io.k8s.api.core.v1.NodeAddress = null,
    allocatable: ?std.json.Value = null,
    capacity: ?std.json.Value = null,
    conditions: ?[]const root.io.k8s.api.core.v1.NodeCondition = null,
    config: ?root.io.k8s.api.core.v1.NodeConfigStatus = null,
    daemonEndpoints: ?root.io.k8s.api.core.v1.NodeDaemonEndpoints = null,
    declaredFeatures: ?[]const []const u8 = null,
    features: ?root.io.k8s.api.core.v1.NodeFeatures = null,
    images: ?[]const root.io.k8s.api.core.v1.ContainerImage = null,
    nodeInfo: ?root.io.k8s.api.core.v1.NodeSystemInfo = null,
    phase: ?[]const u8 = null,
    runtimeHandlers: ?[]const root.io.k8s.api.core.v1.NodeRuntimeHandler = null,
    volumesAttached: ?[]const root.io.k8s.api.core.v1.AttachedVolume = null,
    volumesInUse: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.addresses) |arr| for (arr) |item| try item.validate();
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.config) |v| try v.validate();
        if (self.daemonEndpoints) |v| try v.validate();
        if (self.features) |v| try v.validate();
        if (self.images) |arr| for (arr) |item| try item.validate();
        if (self.nodeInfo) |v| try v.validate();
        if (self.runtimeHandlers) |arr| for (arr) |item| try item.validate();
        if (self.volumesAttached) |arr| for (arr) |item| try item.validate();
    }
};

pub const NodeSwapStatus = struct {
    capacity: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const NodeSystemInfo = struct {
    architecture: []const u8,
    bootID: []const u8,
    containerRuntimeVersion: []const u8,
    kernelVersion: []const u8,
    kubeProxyVersion: []const u8,
    kubeletVersion: []const u8,
    machineID: []const u8,
    operatingSystem: []const u8,
    osImage: []const u8,
    swap: ?root.io.k8s.api.core.v1.NodeSwapStatus = null,
    systemUUID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.swap) |v| try v.validate();
    }
};

pub const ObjectFieldSelector = struct {
    apiVersion: ?[]const u8 = null,
    fieldPath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ObjectReference = struct {
    apiVersion: ?[]const u8 = null,
    fieldPath: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,
    resourceVersion: ?[]const u8 = null,
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PersistentVolume = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.PersistentVolumeSpec = null,
    status: ?root.io.k8s.api.core.v1.PersistentVolumeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PersistentVolumeClaim = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.PersistentVolumeClaimSpec = null,
    status: ?root.io.k8s.api.core.v1.PersistentVolumeClaimStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PersistentVolumeClaimCondition = struct {
    lastProbeTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PersistentVolumeClaimList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.PersistentVolumeClaim,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PersistentVolumeClaimSpec = struct {
    accessModes: ?[]const []const u8 = null,
    dataSource: ?root.io.k8s.api.core.v1.TypedLocalObjectReference = null,
    dataSourceRef: ?root.io.k8s.api.core.v1.TypedObjectReference = null,
    resources: ?root.io.k8s.api.core.v1.VolumeResourceRequirements = null,
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    storageClassName: ?[]const u8 = null,
    volumeAttributesClassName: ?[]const u8 = null,
    volumeMode: ?[]const u8 = null,
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.dataSource) |v| try v.validate();
        if (self.dataSourceRef) |v| try v.validate();
        if (self.resources) |v| try v.validate();
        if (self.selector) |v| try v.validate();
    }
};

pub const PersistentVolumeClaimStatus = struct {
    accessModes: ?[]const []const u8 = null,
    allocatedResourceStatuses: ?std.json.Value = null,
    allocatedResources: ?std.json.Value = null,
    capacity: ?std.json.Value = null,
    conditions: ?[]const root.io.k8s.api.core.v1.PersistentVolumeClaimCondition = null,
    currentVolumeAttributesClassName: ?[]const u8 = null,
    modifyVolumeStatus: ?root.io.k8s.api.core.v1.ModifyVolumeStatus = null,
    phase: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.modifyVolumeStatus) |v| try v.validate();
    }
};

pub const PersistentVolumeClaimTemplate = struct {
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.api.core.v1.PersistentVolumeClaimSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

pub const PersistentVolumeClaimVolumeSource = struct {
    claimName: []const u8,
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PersistentVolumeList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.PersistentVolume,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PersistentVolumeSpec = struct {
    accessModes: ?[]const []const u8 = null,
    awsElasticBlockStore: ?root.io.k8s.api.core.v1.AWSElasticBlockStoreVolumeSource = null,
    azureDisk: ?root.io.k8s.api.core.v1.AzureDiskVolumeSource = null,
    azureFile: ?root.io.k8s.api.core.v1.AzureFilePersistentVolumeSource = null,
    capacity: ?std.json.Value = null,
    cephfs: ?root.io.k8s.api.core.v1.CephFSPersistentVolumeSource = null,
    cinder: ?root.io.k8s.api.core.v1.CinderPersistentVolumeSource = null,
    claimRef: ?root.io.k8s.api.core.v1.ObjectReference = null,
    csi: ?root.io.k8s.api.core.v1.CSIPersistentVolumeSource = null,
    fc: ?root.io.k8s.api.core.v1.FCVolumeSource = null,
    flexVolume: ?root.io.k8s.api.core.v1.FlexPersistentVolumeSource = null,
    flocker: ?root.io.k8s.api.core.v1.FlockerVolumeSource = null,
    gcePersistentDisk: ?root.io.k8s.api.core.v1.GCEPersistentDiskVolumeSource = null,
    glusterfs: ?root.io.k8s.api.core.v1.GlusterfsPersistentVolumeSource = null,
    hostPath: ?root.io.k8s.api.core.v1.HostPathVolumeSource = null,
    iscsi: ?root.io.k8s.api.core.v1.ISCSIPersistentVolumeSource = null,
    local: ?root.io.k8s.api.core.v1.LocalVolumeSource = null,
    mountOptions: ?[]const []const u8 = null,
    nfs: ?root.io.k8s.api.core.v1.NFSVolumeSource = null,
    nodeAffinity: ?root.io.k8s.api.core.v1.VolumeNodeAffinity = null,
    persistentVolumeReclaimPolicy: ?[]const u8 = null,
    photonPersistentDisk: ?root.io.k8s.api.core.v1.PhotonPersistentDiskVolumeSource = null,
    portworxVolume: ?root.io.k8s.api.core.v1.PortworxVolumeSource = null,
    quobyte: ?root.io.k8s.api.core.v1.QuobyteVolumeSource = null,
    rbd: ?root.io.k8s.api.core.v1.RBDPersistentVolumeSource = null,
    scaleIO: ?root.io.k8s.api.core.v1.ScaleIOPersistentVolumeSource = null,
    storageClassName: ?[]const u8 = null,
    storageos: ?root.io.k8s.api.core.v1.StorageOSPersistentVolumeSource = null,
    volumeAttributesClassName: ?[]const u8 = null,
    volumeMode: ?[]const u8 = null,
    vsphereVolume: ?root.io.k8s.api.core.v1.VsphereVirtualDiskVolumeSource = null,

    pub fn validate(self: @This()) !void {
        if (self.awsElasticBlockStore) |v| try v.validate();
        if (self.azureDisk) |v| try v.validate();
        if (self.azureFile) |v| try v.validate();
        if (self.cephfs) |v| try v.validate();
        if (self.cinder) |v| try v.validate();
        if (self.claimRef) |v| try v.validate();
        if (self.csi) |v| try v.validate();
        if (self.fc) |v| try v.validate();
        if (self.flexVolume) |v| try v.validate();
        if (self.flocker) |v| try v.validate();
        if (self.gcePersistentDisk) |v| try v.validate();
        if (self.glusterfs) |v| try v.validate();
        if (self.hostPath) |v| try v.validate();
        if (self.iscsi) |v| try v.validate();
        if (self.local) |v| try v.validate();
        if (self.nfs) |v| try v.validate();
        if (self.nodeAffinity) |v| try v.validate();
        if (self.photonPersistentDisk) |v| try v.validate();
        if (self.portworxVolume) |v| try v.validate();
        if (self.quobyte) |v| try v.validate();
        if (self.rbd) |v| try v.validate();
        if (self.scaleIO) |v| try v.validate();
        if (self.storageos) |v| try v.validate();
        if (self.vsphereVolume) |v| try v.validate();
    }
};

pub const PersistentVolumeStatus = struct {
    lastPhaseTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    phase: ?[]const u8 = null,
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PhotonPersistentDiskVolumeSource = struct {
    fsType: ?[]const u8 = null,
    pdID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Pod = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.PodSpec = null,
    status: ?root.io.k8s.api.core.v1.PodStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const PodAffinity = struct {
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.WeightedPodAffinityTerm = null,
    requiredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PodAffinityTerm = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
    }
};

pub const PodAffinityTerm = struct {
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    matchLabelKeys: ?[]const []const u8 = null,
    mismatchLabelKeys: ?[]const []const u8 = null,
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    namespaces: ?[]const []const u8 = null,
    topologyKey: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
        if (self.namespaceSelector) |v| try v.validate();
    }
};

pub const PodAntiAffinity = struct {
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.WeightedPodAffinityTerm = null,
    requiredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PodAffinityTerm = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
    }
};

pub const PodCertificateProjection = struct {
    certificateChainPath: ?[]const u8 = null,
    credentialBundlePath: ?[]const u8 = null,
    keyPath: ?[]const u8 = null,
    keyType: []const u8,
    maxExpirationSeconds: ?i64 = null,
    signerName: []const u8,
    userAnnotations: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodCondition = struct {
    lastProbeTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    observedGeneration: ?i64 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodDNSConfig = struct {
    nameservers: ?[]const []const u8 = null,
    options: ?[]const root.io.k8s.api.core.v1.PodDNSConfigOption = null,
    searches: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.options) |arr| for (arr) |item| try item.validate();
    }
};

pub const PodDNSConfigOption = struct {
    name: ?[]const u8 = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodExtendedResourceClaimStatus = struct {
    requestMappings: []const root.io.k8s.api.core.v1.ContainerExtendedResourceRequest,
    resourceClaimName: []const u8,

    pub fn validate(self: @This()) !void {
        for (self.requestMappings) |item| try item.validate();
    }
};

pub const PodIP = struct {
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Pod,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PodOS = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodReadinessGate = struct {
    conditionType: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodResourceClaim = struct {
    name: []const u8,
    resourceClaimName: ?[]const u8 = null,
    resourceClaimTemplateName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodResourceClaimStatus = struct {
    name: []const u8,
    resourceClaimName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodSchedulingGate = struct {
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PodSecurityContext = struct {
    appArmorProfile: ?root.io.k8s.api.core.v1.AppArmorProfile = null,
    fsGroup: ?i64 = null,
    fsGroupChangePolicy: ?[]const u8 = null,
    runAsGroup: ?i64 = null,
    runAsNonRoot: ?bool = null,
    runAsUser: ?i64 = null,
    seLinuxChangePolicy: ?[]const u8 = null,
    seLinuxOptions: ?root.io.k8s.api.core.v1.SELinuxOptions = null,
    seccompProfile: ?root.io.k8s.api.core.v1.SeccompProfile = null,
    supplementalGroups: ?[]const i64 = null,
    supplementalGroupsPolicy: ?[]const u8 = null,
    sysctls: ?[]const root.io.k8s.api.core.v1.Sysctl = null,
    windowsOptions: ?root.io.k8s.api.core.v1.WindowsSecurityContextOptions = null,

    pub fn validate(self: @This()) !void {
        if (self.appArmorProfile) |v| try v.validate();
        if (self.seLinuxOptions) |v| try v.validate();
        if (self.seccompProfile) |v| try v.validate();
        if (self.sysctls) |arr| for (arr) |item| try item.validate();
        if (self.windowsOptions) |v| try v.validate();
    }
};

pub const PodSpec = struct {
    activeDeadlineSeconds: ?i64 = null,
    affinity: ?root.io.k8s.api.core.v1.Affinity = null,
    automountServiceAccountToken: ?bool = null,
    containers: []const root.io.k8s.api.core.v1.Container,
    dnsConfig: ?root.io.k8s.api.core.v1.PodDNSConfig = null,
    dnsPolicy: ?[]const u8 = null,
    enableServiceLinks: ?bool = null,
    ephemeralContainers: ?[]const root.io.k8s.api.core.v1.EphemeralContainer = null,
    hostAliases: ?[]const root.io.k8s.api.core.v1.HostAlias = null,
    hostIPC: ?bool = null,
    hostNetwork: ?bool = null,
    hostPID: ?bool = null,
    hostUsers: ?bool = null,
    hostname: ?[]const u8 = null,
    hostnameOverride: ?[]const u8 = null,
    imagePullSecrets: ?[]const root.io.k8s.api.core.v1.LocalObjectReference = null,
    initContainers: ?[]const root.io.k8s.api.core.v1.Container = null,
    nodeName: ?[]const u8 = null,
    nodeSelector: ?std.json.Value = null,
    os: ?root.io.k8s.api.core.v1.PodOS = null,
    overhead: ?std.json.Value = null,
    preemptionPolicy: ?[]const u8 = null,
    priority: ?i64 = null,
    priorityClassName: ?[]const u8 = null,
    readinessGates: ?[]const root.io.k8s.api.core.v1.PodReadinessGate = null,
    resourceClaims: ?[]const root.io.k8s.api.core.v1.PodResourceClaim = null,
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    restartPolicy: ?[]const u8 = null,
    runtimeClassName: ?[]const u8 = null,
    schedulerName: ?[]const u8 = null,
    schedulingGates: ?[]const root.io.k8s.api.core.v1.PodSchedulingGate = null,
    securityContext: ?root.io.k8s.api.core.v1.PodSecurityContext = null,
    serviceAccount: ?[]const u8 = null,
    serviceAccountName: ?[]const u8 = null,
    setHostnameAsFQDN: ?bool = null,
    shareProcessNamespace: ?bool = null,
    subdomain: ?[]const u8 = null,
    terminationGracePeriodSeconds: ?i64 = null,
    tolerations: ?[]const root.io.k8s.api.core.v1.Toleration = null,
    topologySpreadConstraints: ?[]const root.io.k8s.api.core.v1.TopologySpreadConstraint = null,
    volumes: ?[]const root.io.k8s.api.core.v1.Volume = null,
    workloadRef: ?root.io.k8s.api.core.v1.WorkloadReference = null,

    pub fn validate(self: @This()) !void {
        if (self.affinity) |v| try v.validate();
        for (self.containers) |item| try item.validate();
        if (self.dnsConfig) |v| try v.validate();
        if (self.ephemeralContainers) |arr| for (arr) |item| try item.validate();
        if (self.hostAliases) |arr| for (arr) |item| try item.validate();
        if (self.imagePullSecrets) |arr| for (arr) |item| try item.validate();
        if (self.initContainers) |arr| for (arr) |item| try item.validate();
        if (self.os) |v| try v.validate();
        if (self.readinessGates) |arr| for (arr) |item| try item.validate();
        if (self.resourceClaims) |arr| for (arr) |item| try item.validate();
        if (self.resources) |v| try v.validate();
        if (self.schedulingGates) |arr| for (arr) |item| try item.validate();
        if (self.securityContext) |v| try v.validate();
        if (self.tolerations) |arr| for (arr) |item| try item.validate();
        if (self.topologySpreadConstraints) |arr| for (arr) |item| try item.validate();
        if (self.volumes) |arr| for (arr) |item| try item.validate();
        if (self.workloadRef) |v| try v.validate();
    }
};

pub const PodStatus = struct {
    allocatedResources: ?std.json.Value = null,
    conditions: ?[]const root.io.k8s.api.core.v1.PodCondition = null,
    containerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    ephemeralContainerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    extendedResourceClaimStatus: ?root.io.k8s.api.core.v1.PodExtendedResourceClaimStatus = null,
    hostIP: ?[]const u8 = null,
    hostIPs: ?[]const root.io.k8s.api.core.v1.HostIP = null,
    initContainerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    message: ?[]const u8 = null,
    nominatedNodeName: ?[]const u8 = null,
    observedGeneration: ?i64 = null,
    phase: ?[]const u8 = null,
    podIP: ?[]const u8 = null,
    podIPs: ?[]const root.io.k8s.api.core.v1.PodIP = null,
    qosClass: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    resize: ?[]const u8 = null,
    resourceClaimStatuses: ?[]const root.io.k8s.api.core.v1.PodResourceClaimStatus = null,
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    startTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.containerStatuses) |arr| for (arr) |item| try item.validate();
        if (self.ephemeralContainerStatuses) |arr| for (arr) |item| try item.validate();
        if (self.extendedResourceClaimStatus) |v| try v.validate();
        if (self.hostIPs) |arr| for (arr) |item| try item.validate();
        if (self.initContainerStatuses) |arr| for (arr) |item| try item.validate();
        if (self.podIPs) |arr| for (arr) |item| try item.validate();
        if (self.resourceClaimStatuses) |arr| for (arr) |item| try item.validate();
        if (self.resources) |v| try v.validate();
    }
};

pub const PodTemplate = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.template) |v| try v.validate();
    }
};

pub const PodTemplateList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.PodTemplate,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const PodTemplateSpec = struct {
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.PodSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

pub const PortStatus = struct {
    @"error": ?[]const u8 = null,
    port: i64,
    protocol: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PortworxVolumeSource = struct {
    fsType: ?[]const u8 = null,
    readOnly: ?bool = null,
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const PreferredSchedulingTerm = struct {
    preference: root.io.k8s.api.core.v1.NodeSelectorTerm,
    weight: i64,

    pub fn validate(self: @This()) !void {
        try self.preference.validate();
    }
};

pub const Probe = struct {
    exec: ?root.io.k8s.api.core.v1.ExecAction = null,
    failureThreshold: ?i64 = null,
    grpc: ?root.io.k8s.api.core.v1.GRPCAction = null,
    httpGet: ?root.io.k8s.api.core.v1.HTTPGetAction = null,
    initialDelaySeconds: ?i64 = null,
    periodSeconds: ?i64 = null,
    successThreshold: ?i64 = null,
    tcpSocket: ?root.io.k8s.api.core.v1.TCPSocketAction = null,
    terminationGracePeriodSeconds: ?i64 = null,
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.exec) |v| try v.validate();
        if (self.grpc) |v| try v.validate();
        if (self.httpGet) |v| try v.validate();
        if (self.tcpSocket) |v| try v.validate();
    }
};

pub const ProjectedVolumeSource = struct {
    defaultMode: ?i64 = null,
    sources: ?[]const root.io.k8s.api.core.v1.VolumeProjection = null,

    pub fn validate(self: @This()) !void {
        if (self.sources) |arr| for (arr) |item| try item.validate();
    }
};

pub const QuobyteVolumeSource = struct {
    group: ?[]const u8 = null,
    readOnly: ?bool = null,
    registry: []const u8,
    tenant: ?[]const u8 = null,
    user: ?[]const u8 = null,
    volume: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const RBDPersistentVolumeSource = struct {
    fsType: ?[]const u8 = null,
    image: []const u8,
    keyring: ?[]const u8 = null,
    monitors: []const []const u8,
    pool: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const RBDVolumeSource = struct {
    fsType: ?[]const u8 = null,
    image: []const u8,
    keyring: ?[]const u8 = null,
    monitors: []const []const u8,
    pool: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const ReplicationController = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.ReplicationControllerSpec = null,
    status: ?root.io.k8s.api.core.v1.ReplicationControllerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ReplicationControllerCondition = struct {
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    message: ?[]const u8 = null,
    reason: ?[]const u8 = null,
    status: []const u8,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ReplicationControllerList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.ReplicationController,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ReplicationControllerSpec = struct {
    minReadySeconds: ?i64 = null,
    replicas: ?i64 = null,
    selector: ?std.json.Value = null,
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.template) |v| try v.validate();
    }
};

pub const ReplicationControllerStatus = struct {
    availableReplicas: ?i64 = null,
    conditions: ?[]const root.io.k8s.api.core.v1.ReplicationControllerCondition = null,
    fullyLabeledReplicas: ?i64 = null,
    observedGeneration: ?i64 = null,
    readyReplicas: ?i64 = null,
    replicas: i64,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const ResourceClaim = struct {
    name: []const u8,
    request: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceFieldSelector = struct {
    containerName: ?[]const u8 = null,
    divisor: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    resource: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceHealth = struct {
    health: ?[]const u8 = null,
    resourceID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceQuota = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.ResourceQuotaSpec = null,
    status: ?root.io.k8s.api.core.v1.ResourceQuotaStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ResourceQuotaList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.ResourceQuota,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ResourceQuotaSpec = struct {
    hard: ?std.json.Value = null,
    scopeSelector: ?root.io.k8s.api.core.v1.ScopeSelector = null,
    scopes: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.scopeSelector) |v| try v.validate();
    }
};

pub const ResourceQuotaStatus = struct {
    hard: ?std.json.Value = null,
    used: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ResourceRequirements = struct {
    claims: ?[]const root.io.k8s.api.core.v1.ResourceClaim = null,
    limits: ?std.json.Value = null,
    requests: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.claims) |arr| for (arr) |item| try item.validate();
    }
};

pub const ResourceStatus = struct {
    name: []const u8,
    resources: ?[]const root.io.k8s.api.core.v1.ResourceHealth = null,

    pub fn validate(self: @This()) !void {
        if (self.resources) |arr| for (arr) |item| try item.validate();
    }
};

pub const SELinuxOptions = struct {
    level: ?[]const u8 = null,
    role: ?[]const u8 = null,
    @"type": ?[]const u8 = null,
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ScaleIOPersistentVolumeSource = struct {
    fsType: ?[]const u8 = null,
    gateway: []const u8,
    protectionDomain: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: root.io.k8s.api.core.v1.SecretReference,
    sslEnabled: ?bool = null,
    storageMode: ?[]const u8 = null,
    storagePool: ?[]const u8 = null,
    system: []const u8,
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.secretRef.validate();
    }
};

pub const ScaleIOVolumeSource = struct {
    fsType: ?[]const u8 = null,
    gateway: []const u8,
    protectionDomain: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: root.io.k8s.api.core.v1.LocalObjectReference,
    sslEnabled: ?bool = null,
    storageMode: ?[]const u8 = null,
    storagePool: ?[]const u8 = null,
    system: []const u8,
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.secretRef.validate();
    }
};

pub const ScopeSelector = struct {
    matchExpressions: ?[]const root.io.k8s.api.core.v1.ScopedResourceSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchExpressions) |arr| for (arr) |item| try item.validate();
    }
};

pub const ScopedResourceSelectorRequirement = struct {
    operator: []const u8,
    scopeName: []const u8,
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SeccompProfile = struct {
    localhostProfile: ?[]const u8 = null,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Secret = struct {
    apiVersion: ?[]const u8 = null,
    data: ?std.json.Value = null,
    immutable: ?bool = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    stringData: ?std.json.Value = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

pub const SecretEnvSource = struct {
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SecretKeySelector = struct {
    key: []const u8,
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SecretList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Secret,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const SecretProjection = struct {
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    name: ?[]const u8 = null,
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const SecretReference = struct {
    name: ?[]const u8 = null,
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const SecretVolumeSource = struct {
    defaultMode: ?i64 = null,
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    optional: ?bool = null,
    secretName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

pub const SecurityContext = struct {
    allowPrivilegeEscalation: ?bool = null,
    appArmorProfile: ?root.io.k8s.api.core.v1.AppArmorProfile = null,
    capabilities: ?root.io.k8s.api.core.v1.Capabilities = null,
    privileged: ?bool = null,
    procMount: ?[]const u8 = null,
    readOnlyRootFilesystem: ?bool = null,
    runAsGroup: ?i64 = null,
    runAsNonRoot: ?bool = null,
    runAsUser: ?i64 = null,
    seLinuxOptions: ?root.io.k8s.api.core.v1.SELinuxOptions = null,
    seccompProfile: ?root.io.k8s.api.core.v1.SeccompProfile = null,
    windowsOptions: ?root.io.k8s.api.core.v1.WindowsSecurityContextOptions = null,

    pub fn validate(self: @This()) !void {
        if (self.appArmorProfile) |v| try v.validate();
        if (self.capabilities) |v| try v.validate();
        if (self.seLinuxOptions) |v| try v.validate();
        if (self.seccompProfile) |v| try v.validate();
        if (self.windowsOptions) |v| try v.validate();
    }
};

pub const Service = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: ?root.io.k8s.api.core.v1.ServiceSpec = null,
    status: ?root.io.k8s.api.core.v1.ServiceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const ServiceAccount = struct {
    apiVersion: ?[]const u8 = null,
    automountServiceAccountToken: ?bool = null,
    imagePullSecrets: ?[]const root.io.k8s.api.core.v1.LocalObjectReference = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    secrets: ?[]const root.io.k8s.api.core.v1.ObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.imagePullSecrets) |arr| for (arr) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
        if (self.secrets) |arr| for (arr) |item| try item.validate();
    }
};

pub const ServiceAccountList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.ServiceAccount,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ServiceAccountTokenProjection = struct {
    audience: ?[]const u8 = null,
    expirationSeconds: ?i64 = null,
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.api.core.v1.Service,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const ServicePort = struct {
    appProtocol: ?[]const u8 = null,
    name: ?[]const u8 = null,
    nodePort: ?i64 = null,
    port: i64,
    protocol: ?[]const u8 = null,
    targetPort: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceSpec = struct {
    allocateLoadBalancerNodePorts: ?bool = null,
    clusterIP: ?[]const u8 = null,
    clusterIPs: ?[]const []const u8 = null,
    externalIPs: ?[]const []const u8 = null,
    externalName: ?[]const u8 = null,
    externalTrafficPolicy: ?[]const u8 = null,
    healthCheckNodePort: ?i64 = null,
    internalTrafficPolicy: ?[]const u8 = null,
    ipFamilies: ?[]const []const u8 = null,
    ipFamilyPolicy: ?[]const u8 = null,
    loadBalancerClass: ?[]const u8 = null,
    loadBalancerIP: ?[]const u8 = null,
    loadBalancerSourceRanges: ?[]const []const u8 = null,
    ports: ?[]const root.io.k8s.api.core.v1.ServicePort = null,
    publishNotReadyAddresses: ?bool = null,
    selector: ?std.json.Value = null,
    sessionAffinity: ?[]const u8 = null,
    sessionAffinityConfig: ?root.io.k8s.api.core.v1.SessionAffinityConfig = null,
    trafficDistribution: ?[]const u8 = null,
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
        if (self.sessionAffinityConfig) |v| try v.validate();
    }
};

pub const ServiceStatus = struct {
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    loadBalancer: ?root.io.k8s.api.core.v1.LoadBalancerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.loadBalancer) |v| try v.validate();
    }
};

pub const SessionAffinityConfig = struct {
    clientIP: ?root.io.k8s.api.core.v1.ClientIPConfig = null,

    pub fn validate(self: @This()) !void {
        if (self.clientIP) |v| try v.validate();
    }
};

pub const SleepAction = struct {
    seconds: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const StorageOSPersistentVolumeSource = struct {
    fsType: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.ObjectReference = null,
    volumeName: ?[]const u8 = null,
    volumeNamespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const StorageOSVolumeSource = struct {
    fsType: ?[]const u8 = null,
    readOnly: ?bool = null,
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    volumeName: ?[]const u8 = null,
    volumeNamespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

pub const Sysctl = struct {
    name: []const u8,
    value: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TCPSocketAction = struct {
    host: ?[]const u8 = null,
    port: root.io.k8s.apimachinery.pkg.util.intstr.IntOrString,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Taint = struct {
    effect: []const u8,
    key: []const u8,
    timeAdded: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Toleration = struct {
    effect: ?[]const u8 = null,
    key: ?[]const u8 = null,
    operator: ?[]const u8 = null,
    tolerationSeconds: ?i64 = null,
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TopologySelectorLabelRequirement = struct {
    key: []const u8,
    values: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TopologySelectorTerm = struct {
    matchLabelExpressions: ?[]const root.io.k8s.api.core.v1.TopologySelectorLabelRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchLabelExpressions) |arr| for (arr) |item| try item.validate();
    }
};

pub const TopologySpreadConstraint = struct {
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    matchLabelKeys: ?[]const []const u8 = null,
    maxSkew: i64,
    minDomains: ?i64 = null,
    nodeAffinityPolicy: ?[]const u8 = null,
    nodeTaintsPolicy: ?[]const u8 = null,
    topologyKey: []const u8,
    whenUnsatisfiable: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
    }
};

pub const TypedLocalObjectReference = struct {
    apiGroup: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const TypedObjectReference = struct {
    apiGroup: ?[]const u8 = null,
    kind: []const u8,
    name: []const u8,
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const Volume = struct {
    awsElasticBlockStore: ?root.io.k8s.api.core.v1.AWSElasticBlockStoreVolumeSource = null,
    azureDisk: ?root.io.k8s.api.core.v1.AzureDiskVolumeSource = null,
    azureFile: ?root.io.k8s.api.core.v1.AzureFileVolumeSource = null,
    cephfs: ?root.io.k8s.api.core.v1.CephFSVolumeSource = null,
    cinder: ?root.io.k8s.api.core.v1.CinderVolumeSource = null,
    configMap: ?root.io.k8s.api.core.v1.ConfigMapVolumeSource = null,
    csi: ?root.io.k8s.api.core.v1.CSIVolumeSource = null,
    downwardAPI: ?root.io.k8s.api.core.v1.DownwardAPIVolumeSource = null,
    emptyDir: ?root.io.k8s.api.core.v1.EmptyDirVolumeSource = null,
    ephemeral: ?root.io.k8s.api.core.v1.EphemeralVolumeSource = null,
    fc: ?root.io.k8s.api.core.v1.FCVolumeSource = null,
    flexVolume: ?root.io.k8s.api.core.v1.FlexVolumeSource = null,
    flocker: ?root.io.k8s.api.core.v1.FlockerVolumeSource = null,
    gcePersistentDisk: ?root.io.k8s.api.core.v1.GCEPersistentDiskVolumeSource = null,
    gitRepo: ?root.io.k8s.api.core.v1.GitRepoVolumeSource = null,
    glusterfs: ?root.io.k8s.api.core.v1.GlusterfsVolumeSource = null,
    hostPath: ?root.io.k8s.api.core.v1.HostPathVolumeSource = null,
    image: ?root.io.k8s.api.core.v1.ImageVolumeSource = null,
    iscsi: ?root.io.k8s.api.core.v1.ISCSIVolumeSource = null,
    name: []const u8,
    nfs: ?root.io.k8s.api.core.v1.NFSVolumeSource = null,
    persistentVolumeClaim: ?root.io.k8s.api.core.v1.PersistentVolumeClaimVolumeSource = null,
    photonPersistentDisk: ?root.io.k8s.api.core.v1.PhotonPersistentDiskVolumeSource = null,
    portworxVolume: ?root.io.k8s.api.core.v1.PortworxVolumeSource = null,
    projected: ?root.io.k8s.api.core.v1.ProjectedVolumeSource = null,
    quobyte: ?root.io.k8s.api.core.v1.QuobyteVolumeSource = null,
    rbd: ?root.io.k8s.api.core.v1.RBDVolumeSource = null,
    scaleIO: ?root.io.k8s.api.core.v1.ScaleIOVolumeSource = null,
    secret: ?root.io.k8s.api.core.v1.SecretVolumeSource = null,
    storageos: ?root.io.k8s.api.core.v1.StorageOSVolumeSource = null,
    vsphereVolume: ?root.io.k8s.api.core.v1.VsphereVirtualDiskVolumeSource = null,

    pub fn validate(self: @This()) !void {
        if (self.awsElasticBlockStore) |v| try v.validate();
        if (self.azureDisk) |v| try v.validate();
        if (self.azureFile) |v| try v.validate();
        if (self.cephfs) |v| try v.validate();
        if (self.cinder) |v| try v.validate();
        if (self.configMap) |v| try v.validate();
        if (self.csi) |v| try v.validate();
        if (self.downwardAPI) |v| try v.validate();
        if (self.emptyDir) |v| try v.validate();
        if (self.ephemeral) |v| try v.validate();
        if (self.fc) |v| try v.validate();
        if (self.flexVolume) |v| try v.validate();
        if (self.flocker) |v| try v.validate();
        if (self.gcePersistentDisk) |v| try v.validate();
        if (self.gitRepo) |v| try v.validate();
        if (self.glusterfs) |v| try v.validate();
        if (self.hostPath) |v| try v.validate();
        if (self.image) |v| try v.validate();
        if (self.iscsi) |v| try v.validate();
        if (self.nfs) |v| try v.validate();
        if (self.persistentVolumeClaim) |v| try v.validate();
        if (self.photonPersistentDisk) |v| try v.validate();
        if (self.portworxVolume) |v| try v.validate();
        if (self.projected) |v| try v.validate();
        if (self.quobyte) |v| try v.validate();
        if (self.rbd) |v| try v.validate();
        if (self.scaleIO) |v| try v.validate();
        if (self.secret) |v| try v.validate();
        if (self.storageos) |v| try v.validate();
        if (self.vsphereVolume) |v| try v.validate();
    }
};

pub const VolumeDevice = struct {
    devicePath: []const u8,
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VolumeMount = struct {
    mountPath: []const u8,
    mountPropagation: ?[]const u8 = null,
    name: []const u8,
    readOnly: ?bool = null,
    recursiveReadOnly: ?[]const u8 = null,
    subPath: ?[]const u8 = null,
    subPathExpr: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VolumeMountStatus = struct {
    mountPath: []const u8,
    name: []const u8,
    readOnly: ?bool = null,
    recursiveReadOnly: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VolumeNodeAffinity = struct {
    required: ?root.io.k8s.api.core.v1.NodeSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.required) |v| try v.validate();
    }
};

pub const VolumeProjection = struct {
    clusterTrustBundle: ?root.io.k8s.api.core.v1.ClusterTrustBundleProjection = null,
    configMap: ?root.io.k8s.api.core.v1.ConfigMapProjection = null,
    downwardAPI: ?root.io.k8s.api.core.v1.DownwardAPIProjection = null,
    podCertificate: ?root.io.k8s.api.core.v1.PodCertificateProjection = null,
    secret: ?root.io.k8s.api.core.v1.SecretProjection = null,
    serviceAccountToken: ?root.io.k8s.api.core.v1.ServiceAccountTokenProjection = null,

    pub fn validate(self: @This()) !void {
        if (self.clusterTrustBundle) |v| try v.validate();
        if (self.configMap) |v| try v.validate();
        if (self.downwardAPI) |v| try v.validate();
        if (self.podCertificate) |v| try v.validate();
        if (self.secret) |v| try v.validate();
        if (self.serviceAccountToken) |v| try v.validate();
    }
};

pub const VolumeResourceRequirements = struct {
    limits: ?std.json.Value = null,
    requests: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const VsphereVirtualDiskVolumeSource = struct {
    fsType: ?[]const u8 = null,
    storagePolicyID: ?[]const u8 = null,
    storagePolicyName: ?[]const u8 = null,
    volumePath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const WeightedPodAffinityTerm = struct {
    podAffinityTerm: root.io.k8s.api.core.v1.PodAffinityTerm,
    weight: i64,

    pub fn validate(self: @This()) !void {
        try self.podAffinityTerm.validate();
    }
};

pub const WindowsSecurityContextOptions = struct {
    gmsaCredentialSpec: ?[]const u8 = null,
    gmsaCredentialSpecName: ?[]const u8 = null,
    hostProcess: ?bool = null,
    runAsUserName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const WorkloadReference = struct {
    name: []const u8,
    podGroup: []const u8,
    podGroupReplicaKey: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

