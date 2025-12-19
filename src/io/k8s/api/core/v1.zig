// Namespace: v1

const std = @import("std");
const root = @import("../../../../root.zig");


/// Represents a Persistent Disk resource in AWS.
/// 
/// An AWS EBS disk must exist before mounting to a container. The disk must also be in the same AWS zone as the kubelet. An AWS EBS disk can only be mounted as read/write once. AWS EBS volumes support ownership management and SELinux relabeling.
pub const AWSElasticBlockStoreVolumeSource = struct {
    /// fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
    fsType: ?[]const u8 = null,
    /// partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
    partition: ?i64 = null,
    /// readOnly value true will force the readOnly setting in VolumeMounts. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
    readOnly: ?bool = null,
    /// volumeID is unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Affinity is a group of affinity scheduling rules.
pub const Affinity = struct {
    /// Describes node affinity scheduling rules for the pod.
    nodeAffinity: ?root.io.k8s.api.core.v1.NodeAffinity = null,
    /// Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s)).
    podAffinity: ?root.io.k8s.api.core.v1.PodAffinity = null,
    /// Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s)).
    podAntiAffinity: ?root.io.k8s.api.core.v1.PodAntiAffinity = null,

    pub fn validate(self: @This()) !void {
        if (self.nodeAffinity) |v| try v.validate();
        if (self.podAffinity) |v| try v.validate();
        if (self.podAntiAffinity) |v| try v.validate();
    }
};

/// AppArmorProfile defines a pod or container's AppArmor settings.
pub const AppArmorProfile = struct {
    /// localhostProfile indicates a profile loaded on the node that should be used. The profile must be preconfigured on the node to work. Must match the loaded name of the profile. Must be set if and only if type is "Localhost".
    localhostProfile: ?[]const u8 = null,
    /// type indicates which kind of AppArmor profile will be applied. Valid options are:
    ///   Localhost - a profile pre-loaded on the node.
    ///   RuntimeDefault - the container runtime's default profile.
    ///   Unconfined - no AppArmor enforcement.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// AttachedVolume describes a volume attached to a node
pub const AttachedVolume = struct {
    /// DevicePath represents the device path where the volume should be available
    devicePath: []const u8,
    /// Name of the attached volume
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// AzureDisk represents an Azure Data Disk mount on the host and bind mount to the pod.
pub const AzureDiskVolumeSource = struct {
    /// cachingMode is the Host Caching mode: None, Read Only, Read Write.
    cachingMode: ?[]const u8 = null,
    /// diskName is the Name of the data disk in the blob storage
    diskName: []const u8,
    /// diskURI is the URI of data disk in the blob storage
    diskURI: []const u8,
    /// fsType is Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// kind expected values are Shared: multiple blob disks per storage account  Dedicated: single blob disk per storage account  Managed: azure managed data disk (only in managed availability set). defaults to shared
    kind: ?[]const u8 = null,
    /// readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
pub const AzureFilePersistentVolumeSource = struct {
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretName is the name of secret that contains Azure Storage Account Name and Key
    secretName: []const u8,
    /// secretNamespace is the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
    secretNamespace: ?[]const u8 = null,
    /// shareName is the azure Share Name
    shareName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// AzureFile represents an Azure File Service mount on the host and bind mount to the pod.
pub const AzureFileVolumeSource = struct {
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretName is the  name of secret that contains Azure Storage Account Name and Key
    secretName: []const u8,
    /// shareName is the azure share Name
    shareName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Binding ties one object to another; for example, a pod is bound to a node by a scheduler.
pub const Binding = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// The target object that you want to bind to the standard object.
    target: root.io.k8s.api.core.v1.ObjectReference,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.target.validate();
    }
};

/// Represents storage that is managed by an external CSI volume driver
pub const CSIPersistentVolumeSource = struct {
    /// controllerExpandSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI ControllerExpandVolume call. This field is optional, and may be empty if no secret is required. If the secret object contains more than one secret, all secrets are passed.
    controllerExpandSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// controllerPublishSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI ControllerPublishVolume and ControllerUnpublishVolume calls. This field is optional, and may be empty if no secret is required. If the secret object contains more than one secret, all secrets are passed.
    controllerPublishSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// driver is the name of the driver to use for this volume. Required.
    driver: []const u8,
    /// fsType to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs".
    fsType: ?[]const u8 = null,
    /// nodeExpandSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodeExpandVolume call. This field is optional, may be omitted if no secret is required. If the secret object contains more than one secret, all secrets are passed.
    nodeExpandSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// nodePublishSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodePublishVolume and NodeUnpublishVolume calls. This field is optional, and may be empty if no secret is required. If the secret object contains more than one secret, all secrets are passed.
    nodePublishSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// nodeStageSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodeStageVolume and NodeStageVolume and NodeUnstageVolume calls. This field is optional, and may be empty if no secret is required. If the secret object contains more than one secret, all secrets are passed.
    nodeStageSecretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// readOnly value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
    readOnly: ?bool = null,
    /// volumeAttributes of the volume to publish.
    volumeAttributes: ?std.json.Value = null,
    /// volumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
    volumeHandle: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.controllerExpandSecretRef) |v| try v.validate();
        if (self.controllerPublishSecretRef) |v| try v.validate();
        if (self.nodeExpandSecretRef) |v| try v.validate();
        if (self.nodePublishSecretRef) |v| try v.validate();
        if (self.nodeStageSecretRef) |v| try v.validate();
    }
};

/// Represents a source location of a volume to mount, managed by an external CSI driver
pub const CSIVolumeSource = struct {
    /// driver is the name of the CSI driver that handles this volume. Consult with your admin for the correct name as registered in the cluster.
    driver: []const u8,
    /// fsType to mount. Ex. "ext4", "xfs", "ntfs". If not provided, the empty value is passed to the associated CSI driver which will determine the default filesystem to apply.
    fsType: ?[]const u8 = null,
    /// nodePublishSecretRef is a reference to the secret object containing sensitive information to pass to the CSI driver to complete the CSI NodePublishVolume and NodeUnpublishVolume calls. This field is optional, and  may be empty if no secret is required. If the secret object contains more than one secret, all secret references are passed.
    nodePublishSecretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// readOnly specifies a read-only configuration for the volume. Defaults to false (read/write).
    readOnly: ?bool = null,
    /// volumeAttributes stores driver-specific properties that are passed to the CSI driver. Consult your driver's documentation for supported values.
    volumeAttributes: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.nodePublishSecretRef) |v| try v.validate();
    }
};

/// Adds and removes POSIX capabilities from running containers.
pub const Capabilities = struct {
    /// Added capabilities
    add: ?[]const []const u8 = null,
    /// Removed capabilities
    drop: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
pub const CephFSPersistentVolumeSource = struct {
    /// monitors is Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    monitors: []const []const u8,
    /// path is Optional: Used as the mounted root, rather than the full Ceph tree, default is /
    path: ?[]const u8 = null,
    /// readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    readOnly: ?bool = null,
    /// secretFile is Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    secretFile: ?[]const u8 = null,
    /// secretRef is Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// user is Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a Ceph Filesystem mount that lasts the lifetime of a pod Cephfs volumes do not support ownership management or SELinux relabeling.
pub const CephFSVolumeSource = struct {
    /// monitors is Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    monitors: []const []const u8,
    /// path is Optional: Used as the mounted root, rather than the full Ceph tree, default is /
    path: ?[]const u8 = null,
    /// readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    readOnly: ?bool = null,
    /// secretFile is Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    secretFile: ?[]const u8 = null,
    /// secretRef is Optional: SecretRef is reference to the authentication secret for User, default is empty. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// user is optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
pub const CinderPersistentVolumeSource = struct {
    /// fsType Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    fsType: ?[]const u8 = null,
    /// readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    readOnly: ?bool = null,
    /// secretRef is Optional: points to a secret object containing parameters used to connect to OpenStack.
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// volumeID used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a cinder volume resource in Openstack. A Cinder volume must exist before mounting to a container. The volume must also be in the same region as the kubelet. Cinder volumes support ownership management and SELinux relabeling.
pub const CinderVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    fsType: ?[]const u8 = null,
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    readOnly: ?bool = null,
    /// secretRef is optional: points to a secret object containing parameters used to connect to OpenStack.
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// volumeID used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// ClientIPConfig represents the configurations of Client IP based session affinity.
pub const ClientIPConfig = struct {
    /// timeoutSeconds specifies the seconds of ClientIP type session sticky time. The value must be >0 && <=86400(for 1 day) if ServiceAffinity == "ClientIP". Default value is 10800(for 3 hours).
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ClusterTrustBundleProjection describes how to select a set of ClusterTrustBundle objects and project their contents into the pod filesystem.
pub const ClusterTrustBundleProjection = struct {
    /// Select all ClusterTrustBundles that match this label selector.  Only has effect if signerName is set.  Mutually-exclusive with name.  If unset, interpreted as "match nothing".  If set but empty, interpreted as "match everything".
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    /// Select a single ClusterTrustBundle by object name.  Mutually-exclusive with signerName and labelSelector.
    name: ?[]const u8 = null,
    /// If true, don't block pod startup if the referenced ClusterTrustBundle(s) aren't available.  If using name, then the named ClusterTrustBundle is allowed not to exist.  If using signerName, then the combination of signerName and labelSelector is allowed to match zero ClusterTrustBundles.
    optional: ?bool = null,
    /// Relative path from the volume root to write the bundle.
    path: []const u8,
    /// Select all ClusterTrustBundles that match this signer name. Mutually-exclusive with name.  The contents of all selected ClusterTrustBundles will be unified and deduplicated.
    signerName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
    }
};

/// Information about the condition of a component.
pub const ComponentCondition = struct {
    /// Condition error code for a component. For example, a health check error code.
    @"error": ?[]const u8 = null,
    /// Message about the condition for a component. For example, information about a health check.
    message: ?[]const u8 = null,
    /// Status of the condition for a component. Valid values for "Healthy": "True", "False", or "Unknown".
    status: []const u8,
    /// Type of condition for a component. Valid value: "Healthy"
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ComponentStatus (and ComponentStatusList) holds the cluster validation info. Deprecated: This API is deprecated in v1.19+
pub const ComponentStatus = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of component conditions observed
    conditions: ?[]const root.io.k8s.api.core.v1.ComponentCondition = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// Status of all the conditions for the component as a list of ComponentStatus objects. Deprecated: This API is deprecated in v1.19+
pub const ComponentStatusList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of ComponentStatus objects.
    items: []const root.io.k8s.api.core.v1.ComponentStatus,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ConfigMap holds configuration data for pods to consume.
pub const ConfigMap = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// BinaryData contains the binary data. Each key must consist of alphanumeric characters, '-', '_' or '.'. BinaryData can contain byte sequences that are not in the UTF-8 range. The keys stored in BinaryData must not overlap with the ones in the Data field, this is enforced during validation process. Using this field will require 1.10+ apiserver and kubelet.
    binaryData: ?std.json.Value = null,
    /// Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'. Values with non-UTF-8 byte sequences must use the BinaryData field. The keys stored in Data must not overlap with the keys in the BinaryData field, this is enforced during validation process.
    data: ?std.json.Value = null,
    /// Immutable, if set to true, ensures that data stored in the ConfigMap cannot be updated (only object metadata can be modified). If not set to true, the field can be modified at any time. Defaulted to nil.
    immutable: ?bool = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

/// ConfigMapEnvSource selects a ConfigMap to populate the environment variables with.
/// 
/// The contents of the target ConfigMap's Data field will represent the key-value pairs as environment variables.
pub const ConfigMapEnvSource = struct {
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// Specify whether the ConfigMap must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Selects a key from a ConfigMap.
pub const ConfigMapKeySelector = struct {
    /// The key to select.
    key: []const u8,
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// Specify whether the ConfigMap or its key must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ConfigMapList is a resource containing a list of ConfigMap objects.
pub const ConfigMapList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of ConfigMaps.
    items: []const root.io.k8s.api.core.v1.ConfigMap,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ConfigMapNodeConfigSource contains the information to reference a ConfigMap as a config source for the Node. This API is deprecated since 1.22: https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration
pub const ConfigMapNodeConfigSource = struct {
    /// KubeletConfigKey declares which key of the referenced ConfigMap corresponds to the KubeletConfiguration structure This field is required in all cases.
    kubeletConfigKey: []const u8,
    /// Name is the metadata.name of the referenced ConfigMap. This field is required in all cases.
    name: []const u8,
    /// Namespace is the metadata.namespace of the referenced ConfigMap. This field is required in all cases.
    namespace: []const u8,
    /// ResourceVersion is the metadata.ResourceVersion of the referenced ConfigMap. This field is forbidden in Node.Spec, and required in Node.Status.
    resourceVersion: ?[]const u8 = null,
    /// UID is the metadata.UID of the referenced ConfigMap. This field is forbidden in Node.Spec, and required in Node.Status.
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Adapts a ConfigMap into a projected volume.
/// 
/// The contents of the target ConfigMap's Data field will be presented in a projected volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. Note that this is identical to a configmap volume source without the default mode.
pub const ConfigMapProjection = struct {
    /// items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// optional specify whether the ConfigMap or its keys must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// Adapts a ConfigMap into a volume.
/// 
/// The contents of the target ConfigMap's Data field will be presented in a volume as files using the keys in the Data field as the file names, unless the items element is populated with specific mappings of keys to paths. ConfigMap volumes support ownership management and SELinux relabeling.
pub const ConfigMapVolumeSource = struct {
    /// defaultMode is optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    defaultMode: ?i64 = null,
    /// items if unspecified, each key-value pair in the Data field of the referenced ConfigMap will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the ConfigMap, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// optional specify whether the ConfigMap or its keys must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// A single application container that you want to run within a pod.
pub const Container = struct {
    /// Arguments to the entrypoint. The container image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    args: ?[]const []const u8 = null,
    /// Entrypoint array. Not executed within a shell. The container image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    command: ?[]const []const u8 = null,
    /// List of environment variables to set in the container. Cannot be updated.
    env: ?[]const root.io.k8s.api.core.v1.EnvVar = null,
    /// List of sources to populate environment variables in the container. The keys defined within a source may consist of any printable ASCII characters except '='. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
    envFrom: ?[]const root.io.k8s.api.core.v1.EnvFromSource = null,
    /// Container image name. More info: https://kubernetes.io/docs/concepts/containers/images This field is optional to allow higher level config management to default or override container images in workload controllers like Deployments and StatefulSets.
    image: ?[]const u8 = null,
    /// Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images
    imagePullPolicy: ?[]const u8 = null,
    /// Actions that the management system should take in response to container lifecycle events. Cannot be updated.
    lifecycle: ?root.io.k8s.api.core.v1.Lifecycle = null,
    /// Periodic probe of container liveness. Container will be restarted if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
    livenessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Name of the container specified as a DNS_LABEL. Each container in a pod must have a unique name (DNS_LABEL). Cannot be updated.
    name: []const u8,
    /// List of ports to expose from the container. Not specifying a port here DOES NOT prevent that port from being exposed. Any port which is listening on the default "0.0.0.0" address inside a container will be accessible from the network. Modifying this array with strategic merge patch may corrupt the data. For more information See https://github.com/kubernetes/kubernetes/issues/108255. Cannot be updated.
    ports: ?[]const root.io.k8s.api.core.v1.ContainerPort = null,
    /// Periodic probe of container service readiness. Container will be removed from service endpoints if the probe fails. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
    readinessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Resources resize policy for the container. This field cannot be set on ephemeral containers.
    resizePolicy: ?[]const root.io.k8s.api.core.v1.ContainerResizePolicy = null,
    /// Compute Resources required by this container. Cannot be updated. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    /// RestartPolicy defines the restart behavior of individual containers in a pod. This overrides the pod-level restart policy. When this field is not specified, the restart behavior is defined by the Pod's restart policy and the container type. Additionally, setting the RestartPolicy as "Always" for the init container will have the following effect: this init container will be continually restarted on exit until all regular containers have terminated. Once all regular containers have completed, all init containers with restartPolicy "Always" will be shut down. This lifecycle differs from normal init containers and is often referred to as a "sidecar" container. Although this init container still starts in the init container sequence, it does not wait for the container to complete before proceeding to the next init container. Instead, the next init container starts immediately after this init container is started, or after any startupProbe has successfully completed.
    restartPolicy: ?[]const u8 = null,
    /// Represents a list of rules to be checked to determine if the container should be restarted on exit. The rules are evaluated in order. Once a rule matches a container exit condition, the remaining rules are ignored. If no rule matches the container exit condition, the Container-level restart policy determines the whether the container is restarted or not. Constraints on the rules: - At most 20 rules are allowed. - Rules can have the same action. - Identical rules are not forbidden in validations. When rules are specified, container MUST set RestartPolicy explicitly even it if matches the Pod's RestartPolicy.
    restartPolicyRules: ?[]const root.io.k8s.api.core.v1.ContainerRestartRule = null,
    /// SecurityContext defines the security options the container should be run with. If set, the fields of SecurityContext override the equivalent fields of PodSecurityContext. More info: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
    securityContext: ?root.io.k8s.api.core.v1.SecurityContext = null,
    /// StartupProbe indicates that the Pod has successfully initialized. If specified, no other probes are executed until this completes successfully. If this probe fails, the Pod will be restarted, just as if the livenessProbe failed. This can be used to provide different probe parameters at the beginning of a Pod's lifecycle, when it might take a long time to load data or warm a cache, than during steady-state operation. This cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
    startupProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
    stdin: ?bool = null,
    /// Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
    stdinOnce: ?bool = null,
    /// Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
    terminationMessagePath: ?[]const u8 = null,
    /// Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
    terminationMessagePolicy: ?[]const u8 = null,
    /// Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
    tty: ?bool = null,
    /// volumeDevices is the list of block devices to be used by the container.
    volumeDevices: ?[]const root.io.k8s.api.core.v1.VolumeDevice = null,
    /// Pod volumes to mount into the container's filesystem. Cannot be updated.
    volumeMounts: ?[]const root.io.k8s.api.core.v1.VolumeMount = null,
    /// Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
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

/// ContainerExtendedResourceRequest has the mapping of container name, extended resource name to the device request name.
pub const ContainerExtendedResourceRequest = struct {
    /// The name of the container requesting resources.
    containerName: []const u8,
    /// The name of the request in the special ResourceClaim which corresponds to the extended resource.
    requestName: []const u8,
    /// The name of the extended resource in that container which gets backed by DRA.
    resourceName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Describe a container image
pub const ContainerImage = struct {
    /// Names by which this image is known. e.g. ["kubernetes.example/hyperkube:v1.0.7", "cloud-vendor.registry.example/cloud-vendor/hyperkube:v1.0.7"]
    names: ?[]const []const u8 = null,
    /// The size of the image in bytes.
    sizeBytes: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerPort represents a network port in a single container.
pub const ContainerPort = struct {
    /// Number of port to expose on the pod's IP address. This must be a valid port number, 0 < x < 65536.
    containerPort: i64,
    /// What host IP to bind the external port to.
    hostIP: ?[]const u8 = null,
    /// Number of port to expose on the host. If specified, this must be a valid port number, 0 < x < 65536. If HostNetwork is specified, this must match ContainerPort. Most containers do not need this.
    hostPort: ?i64 = null,
    /// If specified, this must be an IANA_SVC_NAME and unique within the pod. Each named port in a pod must have a unique name. Name for the port that can be referred to by services.
    name: ?[]const u8 = null,
    /// Protocol for port. Must be UDP, TCP, or SCTP. Defaults to "TCP".
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerResizePolicy represents resource resize policy for the container.
pub const ContainerResizePolicy = struct {
    /// Name of the resource to which this resource resize policy applies. Supported values: cpu, memory.
    resourceName: []const u8,
    /// Restart policy to apply when specified resource is resized. If not specified, it defaults to NotRequired.
    restartPolicy: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerRestartRule describes how a container exit is handled.
pub const ContainerRestartRule = struct {
    /// Specifies the action taken on a container exit if the requirements are satisfied. The only possible value is "Restart" to restart the container.
    action: []const u8,
    /// Represents the exit codes to check on container exits.
    exitCodes: ?root.io.k8s.api.core.v1.ContainerRestartRuleOnExitCodes = null,

    pub fn validate(self: @This()) !void {
        if (self.exitCodes) |v| try v.validate();
    }
};

/// ContainerRestartRuleOnExitCodes describes the condition for handling an exited container based on its exit codes.
pub const ContainerRestartRuleOnExitCodes = struct {
    /// Represents the relationship between the container exit code(s) and the specified values. Possible values are: - In: the requirement is satisfied if the container exit code is in the
    ///   set of specified values.
    /// - NotIn: the requirement is satisfied if the container exit code is
    ///   not in the set of specified values.
    operator: []const u8,
    /// Specifies the set of values to check for container exit codes. At most 255 elements are allowed.
    values: ?[]const i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerState holds a possible state of container. Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.
pub const ContainerState = struct {
    /// Details about a running container
    running: ?root.io.k8s.api.core.v1.ContainerStateRunning = null,
    /// Details about a terminated container
    terminated: ?root.io.k8s.api.core.v1.ContainerStateTerminated = null,
    /// Details about a waiting container
    waiting: ?root.io.k8s.api.core.v1.ContainerStateWaiting = null,

    pub fn validate(self: @This()) !void {
        if (self.running) |v| try v.validate();
        if (self.terminated) |v| try v.validate();
        if (self.waiting) |v| try v.validate();
    }
};

/// ContainerStateRunning is a running state of a container.
pub const ContainerStateRunning = struct {
    /// Time at which the container was last (re-)started
    startedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerStateTerminated is a terminated state of a container.
pub const ContainerStateTerminated = struct {
    /// Container's ID in the format '<type>://<container_id>'
    containerID: ?[]const u8 = null,
    /// Exit status from the last termination of the container
    exitCode: i64,
    /// Time at which the container last terminated
    finishedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Message regarding the last termination of the container
    message: ?[]const u8 = null,
    /// (brief) reason from the last termination of the container
    reason: ?[]const u8 = null,
    /// Signal from the last termination of the container
    signal: ?i64 = null,
    /// Time at which previous execution of the container started
    startedAt: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerStateWaiting is a waiting state of a container.
pub const ContainerStateWaiting = struct {
    /// Message regarding why the container is not yet running.
    message: ?[]const u8 = null,
    /// (brief) reason the container is not yet running.
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ContainerStatus contains details for the current status of this container.
pub const ContainerStatus = struct {
    /// AllocatedResources represents the compute resources allocated for this container by the node. Kubelet sets this value to Container.Resources.Requests upon successful pod admission and after successfully admitting desired pod resize.
    allocatedResources: ?std.json.Value = null,
    /// AllocatedResourcesStatus represents the status of various resources allocated for this Pod.
    allocatedResourcesStatus: ?[]const root.io.k8s.api.core.v1.ResourceStatus = null,
    /// ContainerID is the ID of the container in the format '<type>://<container_id>'. Where type is a container runtime identifier, returned from Version call of CRI API (for example "containerd").
    containerID: ?[]const u8 = null,
    /// Image is the name of container image that the container is running. The container image may not match the image used in the PodSpec, as it may have been resolved by the runtime. More info: https://kubernetes.io/docs/concepts/containers/images.
    image: []const u8,
    /// ImageID is the image ID of the container's image. The image ID may not match the image ID of the image used in the PodSpec, as it may have been resolved by the runtime.
    imageID: []const u8,
    /// LastTerminationState holds the last termination state of the container to help debug container crashes and restarts. This field is not populated if the container is still running and RestartCount is 0.
    lastState: ?root.io.k8s.api.core.v1.ContainerState = null,
    /// Name is a DNS_LABEL representing the unique name of the container. Each container in a pod must have a unique name across all container types. Cannot be updated.
    name: []const u8,
    /// Ready specifies whether the container is currently passing its readiness check. The value will change as readiness probes keep executing. If no readiness probes are specified, this field defaults to true once the container is fully started (see Started field).
    /// 
    /// The value is typically used to determine whether a container is ready to accept traffic.
    ready: bool,
    /// Resources represents the compute resource requests and limits that have been successfully enacted on the running container after it has been started or has been successfully resized.
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    /// RestartCount holds the number of times the container has been restarted. Kubelet makes an effort to always increment the value, but there are cases when the state may be lost due to node restarts and then the value may be reset to 0. The value is never negative.
    restartCount: i64,
    /// Started indicates whether the container has finished its postStart lifecycle hook and passed its startup probe. Initialized as false, becomes true after startupProbe is considered successful. Resets to false when the container is restarted, or if kubelet loses state temporarily. In both cases, startup probes will run again. Is always true when no startupProbe is defined and container is running and has passed the postStart lifecycle hook. The null value must be treated the same as false.
    started: ?bool = null,
    /// State holds details about the container's current condition.
    state: ?root.io.k8s.api.core.v1.ContainerState = null,
    /// StopSignal reports the effective stop signal for this container
    stopSignal: ?[]const u8 = null,
    /// User represents user identity information initially attached to the first process of the container
    user: ?root.io.k8s.api.core.v1.ContainerUser = null,
    /// Status of volume mounts.
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

/// ContainerUser represents user identity information
pub const ContainerUser = struct {
    /// Linux holds user identity information initially attached to the first process of the containers in Linux. Note that the actual running identity can be changed if the process has enough privilege to do so.
    linux: ?root.io.k8s.api.core.v1.LinuxContainerUser = null,

    pub fn validate(self: @This()) !void {
        if (self.linux) |v| try v.validate();
    }
};

/// DaemonEndpoint contains information about a single Daemon endpoint.
pub const DaemonEndpoint = struct {
    /// Port number of the given endpoint.
    port: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents downward API info for projecting into a projected volume. Note that this is identical to a downwardAPI volume source without the default mode.
pub const DownwardAPIProjection = struct {
    /// Items is a list of DownwardAPIVolume file
    items: ?[]const root.io.k8s.api.core.v1.DownwardAPIVolumeFile = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// DownwardAPIVolumeFile represents information to create the file containing the pod field
pub const DownwardAPIVolumeFile = struct {
    /// Required: Selects a field of the pod: only annotations, labels, name, namespace and uid are supported.
    fieldRef: ?root.io.k8s.api.core.v1.ObjectFieldSelector = null,
    /// Optional: mode bits used to set permissions on this file, must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    mode: ?i64 = null,
    /// Required: Path is  the relative path name of the file to be created. Must not be absolute or contain the '..' path. Must be utf-8 encoded. The first item of the relative path must not start with '..'
    path: []const u8,
    /// Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, requests.cpu and requests.memory) are currently supported.
    resourceFieldRef: ?root.io.k8s.api.core.v1.ResourceFieldSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.fieldRef) |v| try v.validate();
        if (self.resourceFieldRef) |v| try v.validate();
    }
};

/// DownwardAPIVolumeSource represents a volume containing downward API info. Downward API volumes support ownership management and SELinux relabeling.
pub const DownwardAPIVolumeSource = struct {
    /// Optional: mode bits to use on created files by default. Must be a Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    defaultMode: ?i64 = null,
    /// Items is a list of downward API volume file
    items: ?[]const root.io.k8s.api.core.v1.DownwardAPIVolumeFile = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// Represents an empty directory for a pod. Empty directory volumes support ownership management and SELinux relabeling.
pub const EmptyDirVolumeSource = struct {
    /// medium represents what type of storage medium should back this directory. The default is "" which means to use the node's default medium. Must be an empty string (default) or Memory. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
    medium: ?[]const u8 = null,
    /// sizeLimit is the total amount of local storage required for this EmptyDir volume. The size limit is also applicable for memory medium. The maximum usage on memory medium EmptyDir would be the minimum value between the SizeLimit specified here and the sum of memory limits of all containers in a pod. The default is nil which means that the limit is undefined. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
    sizeLimit: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// EndpointAddress is a tuple that describes single IP address. Deprecated: This API is deprecated in v1.33+.
pub const EndpointAddress = struct {
    /// The Hostname of this endpoint
    hostname: ?[]const u8 = null,
    /// The IP of this endpoint. May not be loopback (127.0.0.0/8 or ::1), link-local (169.254.0.0/16 or fe80::/10), or link-local multicast (224.0.0.0/24 or ff02::/16).
    ip: []const u8,
    /// Optional: Node hosting this endpoint. This can be used to determine endpoints local to a node.
    nodeName: ?[]const u8 = null,
    /// Reference to object providing the endpoint.
    targetRef: ?root.io.k8s.api.core.v1.ObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.targetRef) |v| try v.validate();
    }
};

/// EndpointPort is a tuple that describes a single port. Deprecated: This API is deprecated in v1.33+.
pub const EndpointPort = struct {
    /// The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax. Valid values are either:
    /// 
    /// * Un-prefixed protocol names - reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names).
    /// 
    /// * Kubernetes-defined prefixed names:
    ///   * 'kubernetes.io/h2c' - HTTP/2 prior knowledge over cleartext as described in https://www.rfc-editor.org/rfc/rfc9113.html#name-starting-http-2-with-prior-
    ///   * 'kubernetes.io/ws'  - WebSocket over cleartext as described in https://www.rfc-editor.org/rfc/rfc6455
    ///   * 'kubernetes.io/wss' - WebSocket over TLS as described in https://www.rfc-editor.org/rfc/rfc6455
    /// 
    /// * Other protocols should use implementation-defined prefixed names such as mycompany.com/my-custom-protocol.
    appProtocol: ?[]const u8 = null,
    /// The name of this port.  This must match the 'name' field in the corresponding ServicePort. Must be a DNS_LABEL. Optional only if one port is defined.
    name: ?[]const u8 = null,
    /// The port number of the endpoint.
    port: i64,
    /// The IP protocol for this port. Must be UDP, TCP, or SCTP. Default is TCP.
    protocol: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// EndpointSubset is a group of addresses with a common set of ports. The expanded set of endpoints is the Cartesian product of Addresses x Ports. For example, given:
/// 
/// 	{
/// 	  Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
/// 	  Ports:     [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
/// 	}
/// 
/// The resulting set of endpoints can be viewed as:
/// 
/// 	a: [ 10.10.1.1:8675, 10.10.2.2:8675 ],
/// 	b: [ 10.10.1.1:309, 10.10.2.2:309 ]
/// 
/// Deprecated: This API is deprecated in v1.33+.
pub const EndpointSubset = struct {
    /// IP addresses which offer the related ports that are marked as ready. These endpoints should be considered safe for load balancers and clients to utilize.
    addresses: ?[]const root.io.k8s.api.core.v1.EndpointAddress = null,
    /// IP addresses which offer the related ports but are not currently marked as ready because they have not yet finished starting, have recently failed a readiness check, or have recently failed a liveness check.
    notReadyAddresses: ?[]const root.io.k8s.api.core.v1.EndpointAddress = null,
    /// Port numbers available on the related IP addresses.
    ports: ?[]const root.io.k8s.api.core.v1.EndpointPort = null,

    pub fn validate(self: @This()) !void {
        if (self.addresses) |arr| for (arr) |item| try item.validate();
        if (self.notReadyAddresses) |arr| for (arr) |item| try item.validate();
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

/// Endpoints is a collection of endpoints that implement the actual service. Example:
/// 
/// 	 Name: "mysvc",
/// 	 Subsets: [
/// 	   {
/// 	     Addresses: [{"ip": "10.10.1.1"}, {"ip": "10.10.2.2"}],
/// 	     Ports: [{"name": "a", "port": 8675}, {"name": "b", "port": 309}]
/// 	   },
/// 	   {
/// 	     Addresses: [{"ip": "10.10.3.3"}],
/// 	     Ports: [{"name": "a", "port": 93}, {"name": "b", "port": 76}]
/// 	   },
/// 	]
/// 
/// Endpoints is a legacy API and does not contain information about all Service features. Use discoveryv1.EndpointSlice for complete information about Service endpoints.
/// 
/// Deprecated: This API is deprecated in v1.33+. Use discoveryv1.EndpointSlice.
pub const Endpoints = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// The set of all endpoints is the union of all subsets. Addresses are placed into subsets according to the IPs they share. A single address with multiple ports, some of which are ready and some of which are not (because they come from different containers) will result in the address being displayed in different subsets for the different ports. No address will appear in both Addresses and NotReadyAddresses in the same subset. Sets of addresses and ports that comprise a service.
    subsets: ?[]const root.io.k8s.api.core.v1.EndpointSubset = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.subsets) |arr| for (arr) |item| try item.validate();
    }
};

/// EndpointsList is a list of endpoints. Deprecated: This API is deprecated in v1.33+.
pub const EndpointsList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of endpoints.
    items: []const root.io.k8s.api.core.v1.Endpoints,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// EnvFromSource represents the source of a set of ConfigMaps or Secrets
pub const EnvFromSource = struct {
    /// The ConfigMap to select from
    configMapRef: ?root.io.k8s.api.core.v1.ConfigMapEnvSource = null,
    /// Optional text to prepend to the name of each environment variable. May consist of any printable ASCII characters except '='.
    prefix: ?[]const u8 = null,
    /// The Secret to select from
    secretRef: ?root.io.k8s.api.core.v1.SecretEnvSource = null,

    pub fn validate(self: @This()) !void {
        if (self.configMapRef) |v| try v.validate();
        if (self.secretRef) |v| try v.validate();
    }
};

/// EnvVar represents an environment variable present in a Container.
pub const EnvVar = struct {
    /// Name of the environment variable. May consist of any printable ASCII characters except '='.
    name: []const u8,
    /// Variable references $(VAR_NAME) are expanded using the previously defined environment variables in the container and any service environment variables. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Defaults to "".
    value: ?[]const u8 = null,
    /// Source for the environment variable's value. Cannot be used if value is not empty.
    valueFrom: ?root.io.k8s.api.core.v1.EnvVarSource = null,

    pub fn validate(self: @This()) !void {
        if (self.valueFrom) |v| try v.validate();
    }
};

/// EnvVarSource represents a source for the value of an EnvVar.
pub const EnvVarSource = struct {
    /// Selects a key of a ConfigMap.
    configMapKeyRef: ?root.io.k8s.api.core.v1.ConfigMapKeySelector = null,
    /// Selects a field of the pod: supports metadata.name, metadata.namespace, `metadata.labels['<KEY>']`, `metadata.annotations['<KEY>']`, spec.nodeName, spec.serviceAccountName, status.hostIP, status.podIP, status.podIPs.
    fieldRef: ?root.io.k8s.api.core.v1.ObjectFieldSelector = null,
    /// FileKeyRef selects a key of the env file. Requires the EnvFiles feature gate to be enabled.
    fileKeyRef: ?root.io.k8s.api.core.v1.FileKeySelector = null,
    /// Selects a resource of the container: only resources limits and requests (limits.cpu, limits.memory, limits.ephemeral-storage, requests.cpu, requests.memory and requests.ephemeral-storage) are currently supported.
    resourceFieldRef: ?root.io.k8s.api.core.v1.ResourceFieldSelector = null,
    /// Selects a key of a secret in the pod's namespace
    secretKeyRef: ?root.io.k8s.api.core.v1.SecretKeySelector = null,

    pub fn validate(self: @This()) !void {
        if (self.configMapKeyRef) |v| try v.validate();
        if (self.fieldRef) |v| try v.validate();
        if (self.fileKeyRef) |v| try v.validate();
        if (self.resourceFieldRef) |v| try v.validate();
        if (self.secretKeyRef) |v| try v.validate();
    }
};

/// An EphemeralContainer is a temporary container that you may add to an existing Pod for user-initiated activities such as debugging. Ephemeral containers have no resource or scheduling guarantees, and they will not be restarted when they exit or when a Pod is removed or restarted. The kubelet may evict a Pod if an ephemeral container causes the Pod to exceed its resource allocation.
/// 
/// To add an ephemeral container, use the ephemeralcontainers subresource of an existing Pod. Ephemeral containers may not be removed or restarted.
pub const EphemeralContainer = struct {
    /// Arguments to the entrypoint. The image's CMD is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    args: ?[]const []const u8 = null,
    /// Entrypoint array. Not executed within a shell. The image's ENTRYPOINT is used if this is not provided. Variable references $(VAR_NAME) are expanded using the container's environment. If a variable cannot be resolved, the reference in the input string will be unchanged. Double $$ are reduced to a single $, which allows for escaping the $(VAR_NAME) syntax: i.e. "$$(VAR_NAME)" will produce the string literal "$(VAR_NAME)". Escaped references will never be expanded, regardless of whether the variable exists or not. Cannot be updated. More info: https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/#running-a-command-in-a-shell
    command: ?[]const []const u8 = null,
    /// List of environment variables to set in the container. Cannot be updated.
    env: ?[]const root.io.k8s.api.core.v1.EnvVar = null,
    /// List of sources to populate environment variables in the container. The keys defined within a source may consist of any printable ASCII characters except '='. When a key exists in multiple sources, the value associated with the last source will take precedence. Values defined by an Env with a duplicate key will take precedence. Cannot be updated.
    envFrom: ?[]const root.io.k8s.api.core.v1.EnvFromSource = null,
    /// Container image name. More info: https://kubernetes.io/docs/concepts/containers/images
    image: ?[]const u8 = null,
    /// Image pull policy. One of Always, Never, IfNotPresent. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise. Cannot be updated. More info: https://kubernetes.io/docs/concepts/containers/images#updating-images
    imagePullPolicy: ?[]const u8 = null,
    /// Lifecycle is not allowed for ephemeral containers.
    lifecycle: ?root.io.k8s.api.core.v1.Lifecycle = null,
    /// Probes are not allowed for ephemeral containers.
    livenessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Name of the ephemeral container specified as a DNS_LABEL. This name must be unique among all containers, init containers and ephemeral containers.
    name: []const u8,
    /// Ports are not allowed for ephemeral containers.
    ports: ?[]const root.io.k8s.api.core.v1.ContainerPort = null,
    /// Probes are not allowed for ephemeral containers.
    readinessProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Resources resize policy for the container.
    resizePolicy: ?[]const root.io.k8s.api.core.v1.ContainerResizePolicy = null,
    /// Resources are not allowed for ephemeral containers. Ephemeral containers use spare resources already allocated to the pod.
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    /// Restart policy for the container to manage the restart behavior of each container within a pod. You cannot set this field on ephemeral containers.
    restartPolicy: ?[]const u8 = null,
    /// Represents a list of rules to be checked to determine if the container should be restarted on exit. You cannot set this field on ephemeral containers.
    restartPolicyRules: ?[]const root.io.k8s.api.core.v1.ContainerRestartRule = null,
    /// Optional: SecurityContext defines the security options the ephemeral container should be run with. If set, the fields of SecurityContext override the equivalent fields of PodSecurityContext.
    securityContext: ?root.io.k8s.api.core.v1.SecurityContext = null,
    /// Probes are not allowed for ephemeral containers.
    startupProbe: ?root.io.k8s.api.core.v1.Probe = null,
    /// Whether this container should allocate a buffer for stdin in the container runtime. If this is not set, reads from stdin in the container will always result in EOF. Default is false.
    stdin: ?bool = null,
    /// Whether the container runtime should close the stdin channel after it has been opened by a single attach. When stdin is true the stdin stream will remain open across multiple attach sessions. If stdinOnce is set to true, stdin is opened on container start, is empty until the first client attaches to stdin, and then remains open and accepts data until the client disconnects, at which time stdin is closed and remains closed until the container is restarted. If this flag is false, a container processes that reads from stdin will never receive an EOF. Default is false
    stdinOnce: ?bool = null,
    /// If set, the name of the container from PodSpec that this ephemeral container targets. The ephemeral container will be run in the namespaces (IPC, PID, etc) of this container. If not set then the ephemeral container uses the namespaces configured in the Pod spec.
    /// 
    /// The container runtime must implement support for this feature. If the runtime does not support namespace targeting then the result of setting this field is undefined.
    targetContainerName: ?[]const u8 = null,
    /// Optional: Path at which the file to which the container's termination message will be written is mounted into the container's filesystem. Message written is intended to be brief final status, such as an assertion failure message. Will be truncated by the node if greater than 4096 bytes. The total message length across all containers will be limited to 12kb. Defaults to /dev/termination-log. Cannot be updated.
    terminationMessagePath: ?[]const u8 = null,
    /// Indicate how the termination message should be populated. File will use the contents of terminationMessagePath to populate the container status message on both success and failure. FallbackToLogsOnError will use the last chunk of container log output if the termination message file is empty and the container exited with an error. The log output is limited to 2048 bytes or 80 lines, whichever is smaller. Defaults to File. Cannot be updated.
    terminationMessagePolicy: ?[]const u8 = null,
    /// Whether this container should allocate a TTY for itself, also requires 'stdin' to be true. Default is false.
    tty: ?bool = null,
    /// volumeDevices is the list of block devices to be used by the container.
    volumeDevices: ?[]const root.io.k8s.api.core.v1.VolumeDevice = null,
    /// Pod volumes to mount into the container's filesystem. Subpath mounts are not allowed for ephemeral containers. Cannot be updated.
    volumeMounts: ?[]const root.io.k8s.api.core.v1.VolumeMount = null,
    /// Container's working directory. If not specified, the container runtime's default will be used, which might be configured in the container image. Cannot be updated.
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

/// Represents an ephemeral volume that is handled by a normal storage driver.
pub const EphemeralVolumeSource = struct {
    /// Will be used to create a stand-alone PVC to provision the volume. The pod in which this EphemeralVolumeSource is embedded will be the owner of the PVC, i.e. the PVC will be deleted together with the pod.  The name of the PVC will be `<pod name>-<volume name>` where `<volume name>` is the name from the `PodSpec.Volumes` array entry. Pod validation will reject the pod if the concatenated name is not valid for a PVC (for example, too long).
    /// 
    /// An existing PVC with that name that is not owned by the pod will *not* be used for the pod to avoid using an unrelated volume by mistake. Starting the pod is then blocked until the unrelated PVC is removed. If such a pre-created PVC is meant to be used by the pod, the PVC has to updated with an owner reference to the pod once the pod exists. Normally this should not be necessary, but it may be useful when manually reconstructing a broken cluster.
    /// 
    /// This field is read-only and no changes will be made by Kubernetes to the PVC after it has been created.
    /// 
    /// Required, must not be nil.
    volumeClaimTemplate: ?root.io.k8s.api.core.v1.PersistentVolumeClaimTemplate = null,

    pub fn validate(self: @This()) !void {
        if (self.volumeClaimTemplate) |v| try v.validate();
    }
};

/// Event is a report of an event somewhere in the cluster.  Events have a limited retention time and triggers and messages may evolve with time.  Event consumers should not rely on the timing of an event with a given Reason reflecting a consistent underlying trigger, or the continued existence of events with that Reason.  Events should be treated as informative, best-effort, supplemental data.
pub const Event = struct {
    /// What action was taken/failed regarding to the Regarding object.
    action: ?[]const u8 = null,
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// The number of times this event has occurred.
    count: ?i64 = null,
    /// Time when this Event was first observed.
    eventTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,
    /// The time at which the event was first recorded. (Time of server receipt is in TypeMeta.)
    firstTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// The object that this event is about.
    involvedObject: root.io.k8s.api.core.v1.ObjectReference,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// The time at which the most recent occurrence of this event was recorded.
    lastTimestamp: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// A human-readable description of the status of this operation.
    message: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta,
    /// This should be a short, machine understandable string that gives the reason for the transition into the object's current status.
    reason: ?[]const u8 = null,
    /// Optional secondary object for more complex actions.
    related: ?root.io.k8s.api.core.v1.ObjectReference = null,
    /// Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
    reportingComponent: ?[]const u8 = null,
    /// ID of the controller instance, e.g. `kubelet-xyzf`.
    reportingInstance: ?[]const u8 = null,
    /// Data about the Event series this event represents or nil if it's a singleton Event.
    series: ?root.io.k8s.api.core.v1.EventSeries = null,
    /// The component reporting this event. Should be a short machine understandable string.
    source: ?root.io.k8s.api.core.v1.EventSource = null,
    /// Type of this event (Normal, Warning), new types could be added in the future
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.involvedObject.validate();
        try self.metadata.validate();
        if (self.related) |v| try v.validate();
        if (self.series) |v| try v.validate();
        if (self.source) |v| try v.validate();
    }
};

/// EventList is a list of events.
pub const EventList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of events
    items: []const root.io.k8s.api.core.v1.Event,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// EventSeries contain information on series of events, i.e. thing that was/is happening continuously for some time.
pub const EventSeries = struct {
    /// Number of occurrences in this series up to the last heartbeat time
    count: ?i64 = null,
    /// Time of the last occurrence observed
    lastObservedTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// EventSource contains information for an event.
pub const EventSource = struct {
    /// Component from which the event is generated.
    component: ?[]const u8 = null,
    /// Node name on which the event is generated.
    host: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ExecAction describes a "run in container" action.
pub const ExecAction = struct {
    /// Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.
    command: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Fibre Channel volume. Fibre Channel volumes can only be mounted as read/write once. Fibre Channel volumes support ownership management and SELinux relabeling.
pub const FCVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// lun is Optional: FC target lun number
    lun: ?i64 = null,
    /// readOnly is Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// targetWWNs is Optional: FC target worldwide names (WWNs)
    targetWWNs: ?[]const []const u8 = null,
    /// wwids Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
    wwids: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// FileKeySelector selects a key of the env file.
pub const FileKeySelector = struct {
    /// The key within the env file. An invalid key will prevent the pod from starting. The keys defined within a source may consist of any printable ASCII characters except '='. During Alpha stage of the EnvFiles feature gate, the key size is limited to 128 characters.
    key: []const u8,
    /// Specify whether the file or its key must be defined. If the file or key does not exist, then the env var is not published. If optional is set to true and the specified key does not exist, the environment variable will not be set in the Pod's containers.
    /// 
    /// If optional is set to false and the specified key does not exist, an error will be returned during Pod creation.
    optional: ?bool = null,
    /// The path within the volume from which to select the file. Must be relative and may not contain the '..' path or start with '..'.
    path: []const u8,
    /// The name of the volume mount containing the env file.
    volumeName: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// FlexPersistentVolumeSource represents a generic persistent volume resource that is provisioned/attached using an exec based plugin.
pub const FlexPersistentVolumeSource = struct {
    /// driver is the name of the driver to use for this volume.
    driver: []const u8,
    /// fsType is the Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
    fsType: ?[]const u8 = null,
    /// options is Optional: this field holds extra command options if any.
    options: ?std.json.Value = null,
    /// readOnly is Optional: defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef is Optional: SecretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// FlexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin.
pub const FlexVolumeSource = struct {
    /// driver is the name of the driver to use for this volume.
    driver: []const u8,
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
    fsType: ?[]const u8 = null,
    /// options is Optional: this field holds extra command options if any.
    options: ?std.json.Value = null,
    /// readOnly is Optional: defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef is Optional: secretRef is reference to the secret object containing sensitive information to pass to the plugin scripts. This may be empty if no secret object is specified. If the secret object contains more than one secret, all secrets are passed to the plugin scripts.
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a Flocker volume mounted by the Flocker agent. One and only one of datasetName and datasetUUID should be set. Flocker volumes do not support ownership management or SELinux relabeling.
pub const FlockerVolumeSource = struct {
    /// datasetName is Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
    datasetName: ?[]const u8 = null,
    /// datasetUUID is the UUID of the dataset. This is unique identifier of a Flocker dataset
    datasetUUID: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Persistent Disk resource in Google Compute Engine.
/// 
/// A GCE PD must exist before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once or read-only many times. GCE PDs support ownership management and SELinux relabeling.
pub const GCEPersistentDiskVolumeSource = struct {
    /// fsType is filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    fsType: ?[]const u8 = null,
    /// partition is the partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    partition: ?i64 = null,
    /// pdName is unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    pdName: []const u8,
    /// readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// GRPCAction specifies an action involving a GRPC service.
pub const GRPCAction = struct {
    /// Port number of the gRPC service. Number must be in the range 1 to 65535.
    port: i64,
    /// Service is the name of the service to place in the gRPC HealthCheckRequest (see https://github.com/grpc/grpc/blob/master/doc/health-checking.md).
    /// 
    /// If this is not specified, the default behavior is defined by gRPC.
    service: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a volume that is populated with the contents of a git repository. Git repo volumes do not support ownership management. Git repo volumes support SELinux relabeling.
/// 
/// DEPRECATED: GitRepo is deprecated. To provision a container with a git repo, mount an EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir into the Pod's container.
pub const GitRepoVolumeSource = struct {
    /// directory is the target directory name. Must not contain or start with '..'.  If '.' is supplied, the volume directory will be the git repository.  Otherwise, if specified, the volume will contain the git repository in the subdirectory with the given name.
    directory: ?[]const u8 = null,
    /// repository is the URL
    repository: []const u8,
    /// revision is the commit hash for the specified revision.
    revision: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
pub const GlusterfsPersistentVolumeSource = struct {
    /// endpoints is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    endpoints: []const u8,
    /// endpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    endpointsNamespace: ?[]const u8 = null,
    /// path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    path: []const u8,
    /// readOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs volumes do not support ownership management or SELinux relabeling.
pub const GlusterfsVolumeSource = struct {
    /// endpoints is the endpoint name that details Glusterfs topology.
    endpoints: []const u8,
    /// path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    path: []const u8,
    /// readOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// HTTPGetAction describes an action based on HTTP Get requests.
pub const HTTPGetAction = struct {
    /// Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.
    host: ?[]const u8 = null,
    /// Custom headers to set in the request. HTTP allows repeated headers.
    httpHeaders: ?[]const root.io.k8s.api.core.v1.HTTPHeader = null,
    /// Path to access on the HTTP server.
    path: ?[]const u8 = null,
    /// Name or number of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
    port: root.io.k8s.apimachinery.pkg.util.intstr.IntOrString,
    /// Scheme to use for connecting to the host. Defaults to HTTP.
    scheme: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.httpHeaders) |arr| for (arr) |item| try item.validate();
    }
};

/// HTTPHeader describes a custom header to be used in HTTP probes
pub const HTTPHeader = struct {
    /// The header field name. This will be canonicalized upon output, so case-variant names will be understood as the same header.
    name: []const u8,
    /// The header field value
    value: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// HostAlias holds the mapping between IP and hostnames that will be injected as an entry in the pod's hosts file.
pub const HostAlias = struct {
    /// Hostnames for the above IP address.
    hostnames: ?[]const []const u8 = null,
    /// IP address of the host file entry.
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// HostIP represents a single IP address allocated to the host.
pub const HostIP = struct {
    /// IP is the IP address assigned to the host
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a host path mapped into a pod. Host path volumes do not support ownership management or SELinux relabeling.
pub const HostPathVolumeSource = struct {
    /// path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    path: []const u8,
    /// type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
pub const ISCSIPersistentVolumeSource = struct {
    /// chapAuthDiscovery defines whether support iSCSI Discovery CHAP authentication
    chapAuthDiscovery: ?bool = null,
    /// chapAuthSession defines whether support iSCSI Session CHAP authentication
    chapAuthSession: ?bool = null,
    /// fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
    fsType: ?[]const u8 = null,
    /// initiatorName is the custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
    initiatorName: ?[]const u8 = null,
    /// iqn is Target iSCSI Qualified Name.
    iqn: []const u8,
    /// iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
    iscsiInterface: ?[]const u8 = null,
    /// lun is iSCSI Target Lun number.
    lun: i64,
    /// portals is the iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
    portals: ?[]const []const u8 = null,
    /// readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
    readOnly: ?bool = null,
    /// secretRef is the CHAP Secret for iSCSI target and initiator authentication
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// targetPortal is iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
    targetPortal: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents an ISCSI disk. ISCSI volumes can only be mounted as read/write once. ISCSI volumes support ownership management and SELinux relabeling.
pub const ISCSIVolumeSource = struct {
    /// chapAuthDiscovery defines whether support iSCSI Discovery CHAP authentication
    chapAuthDiscovery: ?bool = null,
    /// chapAuthSession defines whether support iSCSI Session CHAP authentication
    chapAuthSession: ?bool = null,
    /// fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
    fsType: ?[]const u8 = null,
    /// initiatorName is the custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
    initiatorName: ?[]const u8 = null,
    /// iqn is the target iSCSI Qualified Name.
    iqn: []const u8,
    /// iscsiInterface is the interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
    iscsiInterface: ?[]const u8 = null,
    /// lun represents iSCSI Target Lun number.
    lun: i64,
    /// portals is the iSCSI Target Portal List. The portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
    portals: ?[]const []const u8 = null,
    /// readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
    readOnly: ?bool = null,
    /// secretRef is the CHAP Secret for iSCSI target and initiator authentication
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// targetPortal is iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
    targetPortal: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// ImageVolumeSource represents a image volume resource.
pub const ImageVolumeSource = struct {
    /// Policy for pulling OCI objects. Possible values are: Always: the kubelet always attempts to pull the reference. Container creation will fail If the pull fails. Never: the kubelet never pulls the reference and only uses a local image or artifact. Container creation will fail if the reference isn't present. IfNotPresent: the kubelet pulls if the reference isn't already present on disk. Container creation will fail if the reference isn't present and the pull fails. Defaults to Always if :latest tag is specified, or IfNotPresent otherwise.
    pullPolicy: ?[]const u8 = null,
    /// Required: Image or artifact reference to be used. Behaves in the same way as pod.spec.containers[*].image. Pull secrets will be assembled in the same way as for the container image by looking up node credentials, SA image pull secrets, and pod spec image pull secrets. More info: https://kubernetes.io/docs/concepts/containers/images This field is optional to allow higher level config management to default or override container images in workload controllers like Deployments and StatefulSets.
    reference: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ImageVolumeStatus represents the image-based volume status.
pub const ImageVolumeStatus = struct {
    /// ImageRef is the digest of the image used for this volume. It should have a value that's similar to the pod's status.containerStatuses[i].imageID. The ImageRef length should not exceed 256 characters.
    imageRef: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Maps a string key to a path within a volume.
pub const KeyToPath = struct {
    /// key is the key to project.
    key: []const u8,
    /// mode is Optional: mode bits used to set permissions on this file. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. If not specified, the volume defaultMode will be used. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    mode: ?i64 = null,
    /// path is the relative path of the file to map the key to. May not be an absolute path. May not contain the path element '..'. May not start with the string '..'.
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Lifecycle describes actions that the management system should take in response to container lifecycle events. For the PostStart and PreStop lifecycle handlers, management of the container blocks until the action is complete, unless the container process fails, in which case the handler is aborted.
pub const Lifecycle = struct {
    /// PostStart is called immediately after a container is created. If the handler fails, the container is terminated and restarted according to its restart policy. Other management of the container blocks until the hook completes. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
    postStart: ?root.io.k8s.api.core.v1.LifecycleHandler = null,
    /// PreStop is called immediately before a container is terminated due to an API request or management event such as liveness/startup probe failure, preemption, resource contention, etc. The handler is not called if the container crashes or exits. The Pod's termination grace period countdown begins before the PreStop hook is executed. Regardless of the outcome of the handler, the container will eventually terminate within the Pod's termination grace period (unless delayed by finalizers). Other management of the container blocks until the hook completes or until the termination grace period is reached. More info: https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/#container-hooks
    preStop: ?root.io.k8s.api.core.v1.LifecycleHandler = null,
    /// StopSignal defines which signal will be sent to a container when it is being stopped. If not specified, the default is defined by the container runtime in use. StopSignal can only be set for Pods with a non-empty .spec.os.name
    stopSignal: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.postStart) |v| try v.validate();
        if (self.preStop) |v| try v.validate();
    }
};

/// LifecycleHandler defines a specific action that should be taken in a lifecycle hook. One and only one of the fields, except TCPSocket must be specified.
pub const LifecycleHandler = struct {
    /// Exec specifies a command to execute in the container.
    exec: ?root.io.k8s.api.core.v1.ExecAction = null,
    /// HTTPGet specifies an HTTP GET request to perform.
    httpGet: ?root.io.k8s.api.core.v1.HTTPGetAction = null,
    /// Sleep represents a duration that the container should sleep.
    sleep: ?root.io.k8s.api.core.v1.SleepAction = null,
    /// Deprecated. TCPSocket is NOT supported as a LifecycleHandler and kept for backward compatibility. There is no validation of this field and lifecycle hooks will fail at runtime when it is specified.
    tcpSocket: ?root.io.k8s.api.core.v1.TCPSocketAction = null,

    pub fn validate(self: @This()) !void {
        if (self.exec) |v| try v.validate();
        if (self.httpGet) |v| try v.validate();
        if (self.sleep) |v| try v.validate();
        if (self.tcpSocket) |v| try v.validate();
    }
};

/// LimitRange sets resource usage limits for each kind of resource in a Namespace.
pub const LimitRange = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the limits enforced. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.LimitRangeSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

/// LimitRangeItem defines a min/max usage limit for any resource that matches on kind.
pub const LimitRangeItem = struct {
    /// Default resource requirement limit value by resource name if resource limit is omitted.
    default: ?std.json.Value = null,
    /// DefaultRequest is the default resource requirement request value by resource name if resource request is omitted.
    defaultRequest: ?std.json.Value = null,
    /// Max usage constraints on this kind by resource name.
    max: ?std.json.Value = null,
    /// MaxLimitRequestRatio if specified, the named resource must have a request and limit that are both non-zero where limit divided by request is less than or equal to the enumerated value; this represents the max burst for the named resource.
    maxLimitRequestRatio: ?std.json.Value = null,
    /// Min usage constraints on this kind by resource name.
    min: ?std.json.Value = null,
    /// Type of resource that this limit applies to.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// LimitRangeList is a list of LimitRange items.
pub const LimitRangeList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is a list of LimitRange objects. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    items: []const root.io.k8s.api.core.v1.LimitRange,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// LimitRangeSpec defines a min/max usage limit for resources that match on kind.
pub const LimitRangeSpec = struct {
    /// Limits is the list of LimitRangeItem objects that are enforced.
    limits: []const root.io.k8s.api.core.v1.LimitRangeItem,

    pub fn validate(self: @This()) !void {
        for (self.limits) |item| try item.validate();
    }
};

/// LinuxContainerUser represents user identity information in Linux containers
pub const LinuxContainerUser = struct {
    /// GID is the primary gid initially attached to the first process in the container
    gid: i64,
    /// SupplementalGroups are the supplemental groups initially attached to the first process in the container
    supplementalGroups: ?[]const i64 = null,
    /// UID is the primary uid initially attached to the first process in the container
    uid: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// LoadBalancerIngress represents the status of a load-balancer ingress point: traffic intended for the service should be sent to an ingress point.
pub const LoadBalancerIngress = struct {
    /// Hostname is set for load-balancer ingress points that are DNS based (typically AWS load-balancers)
    hostname: ?[]const u8 = null,
    /// IP is set for load-balancer ingress points that are IP based (typically GCE or OpenStack load-balancers)
    ip: ?[]const u8 = null,
    /// IPMode specifies how the load-balancer IP behaves, and may only be specified when the ip field is specified. Setting this to "VIP" indicates that traffic is delivered to the node with the destination set to the load-balancer's IP and port. Setting this to "Proxy" indicates that traffic is delivered to the node or pod with the destination set to the node's IP and node port or the pod's IP and port. Service implementations may use this information to adjust traffic routing.
    ipMode: ?[]const u8 = null,
    /// Ports is a list of records of service ports If used, every port defined in the service should have an entry in it
    ports: ?[]const root.io.k8s.api.core.v1.PortStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
    }
};

/// LoadBalancerStatus represents the status of a load-balancer.
pub const LoadBalancerStatus = struct {
    /// Ingress is a list containing ingress points for the load-balancer. Traffic intended for the service should be sent to these ingress points.
    ingress: ?[]const root.io.k8s.api.core.v1.LoadBalancerIngress = null,

    pub fn validate(self: @This()) !void {
        if (self.ingress) |arr| for (arr) |item| try item.validate();
    }
};

/// LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace.
pub const LocalObjectReference = struct {
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Local represents directly-attached storage with node affinity
pub const LocalVolumeSource = struct {
    /// fsType is the filesystem type to mount. It applies only when the Path is a block device. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default value is to auto-select a filesystem if unspecified.
    fsType: ?[]const u8 = null,
    /// path of the full path to the volume on the node. It can be either a directory or block device (disk, partition, ...).
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ModifyVolumeStatus represents the status object of ControllerModifyVolume operation
pub const ModifyVolumeStatus = struct {
    /// status is the status of the ControllerModifyVolume operation. It can be in any of following states:
    ///  - Pending
    ///    Pending indicates that the PersistentVolumeClaim cannot be modified due to unmet requirements, such as
    ///    the specified VolumeAttributesClass not existing.
    ///  - InProgress
    ///    InProgress indicates that the volume is being modified.
    ///  - Infeasible
    ///   Infeasible indicates that the request has been rejected as invalid by the CSI driver. To
    /// 	  resolve the error, a valid VolumeAttributesClass needs to be specified.
    /// Note: New statuses can be added in the future. Consumers should check for unknown statuses and fail appropriately.
    status: []const u8,
    /// targetVolumeAttributesClassName is the name of the VolumeAttributesClass the PVC currently being reconciled
    targetVolumeAttributesClassName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do not support ownership management or SELinux relabeling.
pub const NFSVolumeSource = struct {
    /// path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
    path: []const u8,
    /// readOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
    readOnly: ?bool = null,
    /// server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
    server: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Namespace provides a scope for Names. Use of multiple namespaces is optional.
pub const Namespace = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the behavior of the Namespace. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.NamespaceSpec = null,
    /// Status describes the current status of a Namespace. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.NamespaceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// NamespaceCondition contains details about state of namespace.
pub const NamespaceCondition = struct {
    /// Last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Human-readable message indicating details about last transition.
    message: ?[]const u8 = null,
    /// Unique, one-word, CamelCase reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// Status of the condition, one of True, False, Unknown.
    status: []const u8,
    /// Type of namespace controller condition.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NamespaceList is a list of Namespaces.
pub const NamespaceList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is the list of Namespace objects in the list. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
    items: []const root.io.k8s.api.core.v1.Namespace,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// NamespaceSpec describes the attributes on a Namespace.
pub const NamespaceSpec = struct {
    /// Finalizers is an opaque list of values that must be empty to permanently remove object from storage. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
    finalizers: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NamespaceStatus is information about the current status of a Namespace.
pub const NamespaceStatus = struct {
    /// Represents the latest available observations of a namespace's current state.
    conditions: ?[]const root.io.k8s.api.core.v1.NamespaceCondition = null,
    /// Phase is the current lifecycle phase of the namespace. More info: https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
    phase: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// Node is a worker node in Kubernetes. Each node will have a unique identifier in the cache (i.e. in etcd).
pub const Node = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the behavior of a node. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.NodeSpec = null,
    /// Most recently observed status of the node. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.NodeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// NodeAddress contains information for the node's address.
pub const NodeAddress = struct {
    /// The node address.
    address: []const u8,
    /// Node address type, one of Hostname, ExternalIP or InternalIP.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Node affinity is a group of node affinity scheduling rules.
pub const NodeAffinity = struct {
    /// The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PreferredSchedulingTerm = null,
    /// If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to an update), the system may or may not try to eventually evict the pod from its node.
    requiredDuringSchedulingIgnoredDuringExecution: ?root.io.k8s.api.core.v1.NodeSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |v| try v.validate();
    }
};

/// NodeCondition contains condition information for a node.
pub const NodeCondition = struct {
    /// Last time we got an update on a given condition.
    lastHeartbeatTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Last time the condition transit from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Human readable message indicating details about last transition.
    message: ?[]const u8 = null,
    /// (brief) reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// Status of the condition, one of True, False, Unknown.
    status: []const u8,
    /// Type of node condition.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NodeConfigSource specifies a source of node configuration. Exactly one subfield (excluding metadata) must be non-nil. This API is deprecated since 1.22
pub const NodeConfigSource = struct {
    /// ConfigMap is a reference to a Node's ConfigMap
    configMap: ?root.io.k8s.api.core.v1.ConfigMapNodeConfigSource = null,

    pub fn validate(self: @This()) !void {
        if (self.configMap) |v| try v.validate();
    }
};

/// NodeConfigStatus describes the status of the config assigned by Node.Spec.ConfigSource.
pub const NodeConfigStatus = struct {
    /// Active reports the checkpointed config the node is actively using. Active will represent either the current version of the Assigned config, or the current LastKnownGood config, depending on whether attempting to use the Assigned config results in an error.
    active: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    /// Assigned reports the checkpointed config the node will try to use. When Node.Spec.ConfigSource is updated, the node checkpoints the associated config payload to local disk, along with a record indicating intended config. The node refers to this record to choose its config checkpoint, and reports this record in Assigned. Assigned only updates in the status after the record has been checkpointed to disk. When the Kubelet is restarted, it tries to make the Assigned config the Active config by loading and validating the checkpointed payload identified by Assigned.
    assigned: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    /// Error describes any problems reconciling the Spec.ConfigSource to the Active config. Errors may occur, for example, attempting to checkpoint Spec.ConfigSource to the local Assigned record, attempting to checkpoint the payload associated with Spec.ConfigSource, attempting to load or validate the Assigned config, etc. Errors may occur at different points while syncing config. Earlier errors (e.g. download or checkpointing errors) will not result in a rollback to LastKnownGood, and may resolve across Kubelet retries. Later errors (e.g. loading or validating a checkpointed config) will result in a rollback to LastKnownGood. In the latter case, it is usually possible to resolve the error by fixing the config assigned in Spec.ConfigSource. You can find additional information for debugging by searching the error message in the Kubelet log. Error is a human-readable description of the error state; machines can check whether or not Error is empty, but should not rely on the stability of the Error text across Kubelet versions.
    @"error": ?[]const u8 = null,
    /// LastKnownGood reports the checkpointed config the node will fall back to when it encounters an error attempting to use the Assigned config. The Assigned config becomes the LastKnownGood config when the node determines that the Assigned config is stable and correct. This is currently implemented as a 10-minute soak period starting when the local record of Assigned config is updated. If the Assigned config is Active at the end of this period, it becomes the LastKnownGood. Note that if Spec.ConfigSource is reset to nil (use local defaults), the LastKnownGood is also immediately reset to nil, because the local default config is always assumed good. You should not make assumptions about the node's method of determining config stability and correctness, as this may change or become configurable in the future.
    lastKnownGood: ?root.io.k8s.api.core.v1.NodeConfigSource = null,

    pub fn validate(self: @This()) !void {
        if (self.active) |v| try v.validate();
        if (self.assigned) |v| try v.validate();
        if (self.lastKnownGood) |v| try v.validate();
    }
};

/// NodeDaemonEndpoints lists ports opened by daemons running on the Node.
pub const NodeDaemonEndpoints = struct {
    /// Endpoint on which Kubelet is listening.
    kubeletEndpoint: ?root.io.k8s.api.core.v1.DaemonEndpoint = null,

    pub fn validate(self: @This()) !void {
        if (self.kubeletEndpoint) |v| try v.validate();
    }
};

/// NodeFeatures describes the set of features implemented by the CRI implementation. The features contained in the NodeFeatures should depend only on the cri implementation independent of runtime handlers.
pub const NodeFeatures = struct {
    /// SupplementalGroupsPolicy is set to true if the runtime supports SupplementalGroupsPolicy and ContainerUser.
    supplementalGroupsPolicy: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NodeList is the whole list of all Nodes which have been registered with master.
pub const NodeList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of nodes
    items: []const root.io.k8s.api.core.v1.Node,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// NodeRuntimeHandler is a set of runtime handler information.
pub const NodeRuntimeHandler = struct {
    /// Supported features.
    features: ?root.io.k8s.api.core.v1.NodeRuntimeHandlerFeatures = null,
    /// Runtime handler name. Empty for the default runtime handler.
    name: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.features) |v| try v.validate();
    }
};

/// NodeRuntimeHandlerFeatures is a set of features implemented by the runtime handler.
pub const NodeRuntimeHandlerFeatures = struct {
    /// RecursiveReadOnlyMounts is set to true if the runtime handler supports RecursiveReadOnlyMounts.
    recursiveReadOnlyMounts: ?bool = null,
    /// UserNamespaces is set to true if the runtime handler supports UserNamespaces, including for volumes.
    userNamespaces: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A node selector represents the union of the results of one or more label queries over a set of nodes; that is, it represents the OR of the selectors represented by the node selector terms.
pub const NodeSelector = struct {
    /// Required. A list of node selector terms. The terms are ORed.
    nodeSelectorTerms: []const root.io.k8s.api.core.v1.NodeSelectorTerm,

    pub fn validate(self: @This()) !void {
        for (self.nodeSelectorTerms) |item| try item.validate();
    }
};

/// A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values.
pub const NodeSelectorRequirement = struct {
    /// The label key that the selector applies to.
    key: []const u8,
    /// Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt.
    operator: []const u8,
    /// An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch.
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm.
pub const NodeSelectorTerm = struct {
    /// A list of node selector requirements by node's labels.
    matchExpressions: ?[]const root.io.k8s.api.core.v1.NodeSelectorRequirement = null,
    /// A list of node selector requirements by node's fields.
    matchFields: ?[]const root.io.k8s.api.core.v1.NodeSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchExpressions) |arr| for (arr) |item| try item.validate();
        if (self.matchFields) |arr| for (arr) |item| try item.validate();
    }
};

/// NodeSpec describes the attributes that a node is created with.
pub const NodeSpec = struct {
    /// Deprecated: Previously used to specify the source of the node's configuration for the DynamicKubeletConfig feature. This feature is removed.
    configSource: ?root.io.k8s.api.core.v1.NodeConfigSource = null,
    /// Deprecated. Not all kubelets will set this field. Remove field after 1.13. see: https://issues.k8s.io/61966
    externalID: ?[]const u8 = null,
    /// PodCIDR represents the pod IP range assigned to the node.
    podCIDR: ?[]const u8 = null,
    /// podCIDRs represents the IP ranges assigned to the node for usage by Pods on that node. If this field is specified, the 0th entry must match the podCIDR field. It may contain at most 1 value for each of IPv4 and IPv6.
    podCIDRs: ?[]const []const u8 = null,
    /// ID of the node assigned by the cloud provider in the format: <ProviderName>://<ProviderSpecificNodeID>
    providerID: ?[]const u8 = null,
    /// If specified, the node's taints.
    taints: ?[]const root.io.k8s.api.core.v1.Taint = null,
    /// Unschedulable controls node schedulability of new pods. By default, node is schedulable. More info: https://kubernetes.io/docs/concepts/nodes/node/#manual-node-administration
    unschedulable: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.configSource) |v| try v.validate();
        if (self.taints) |arr| for (arr) |item| try item.validate();
    }
};

/// NodeStatus is information about the current status of a node.
pub const NodeStatus = struct {
    /// List of addresses reachable to the node. Queried from cloud provider, if available. More info: https://kubernetes.io/docs/reference/node/node-status/#addresses Note: This field is declared as mergeable, but the merge key is not sufficiently unique, which can cause data corruption when it is merged. Callers should instead use a full-replacement patch. See https://pr.k8s.io/79391 for an example. Consumers should assume that addresses can change during the lifetime of a Node. However, there are some exceptions where this may not be possible, such as Pods that inherit a Node's address in its own status or consumers of the downward API (status.hostIP).
    addresses: ?[]const root.io.k8s.api.core.v1.NodeAddress = null,
    /// Allocatable represents the resources of a node that are available for scheduling. Defaults to Capacity.
    allocatable: ?std.json.Value = null,
    /// Capacity represents the total resources of a node. More info: https://kubernetes.io/docs/reference/node/node-status/#capacity
    capacity: ?std.json.Value = null,
    /// Conditions is an array of current observed node conditions. More info: https://kubernetes.io/docs/reference/node/node-status/#condition
    conditions: ?[]const root.io.k8s.api.core.v1.NodeCondition = null,
    /// Status of the config assigned to the node via the dynamic Kubelet config feature.
    config: ?root.io.k8s.api.core.v1.NodeConfigStatus = null,
    /// Endpoints of daemons running on the Node.
    daemonEndpoints: ?root.io.k8s.api.core.v1.NodeDaemonEndpoints = null,
    /// DeclaredFeatures represents the features related to feature gates that are declared by the node.
    declaredFeatures: ?[]const []const u8 = null,
    /// Features describes the set of features implemented by the CRI implementation.
    features: ?root.io.k8s.api.core.v1.NodeFeatures = null,
    /// List of container images on this node
    images: ?[]const root.io.k8s.api.core.v1.ContainerImage = null,
    /// Set of ids/uuids to uniquely identify the node. More info: https://kubernetes.io/docs/reference/node/node-status/#info
    nodeInfo: ?root.io.k8s.api.core.v1.NodeSystemInfo = null,
    /// NodePhase is the recently observed lifecycle phase of the node. More info: https://kubernetes.io/docs/concepts/nodes/node/#phase The field is never populated, and now is deprecated.
    phase: ?[]const u8 = null,
    /// The available runtime handlers.
    runtimeHandlers: ?[]const root.io.k8s.api.core.v1.NodeRuntimeHandler = null,
    /// List of volumes that are attached to the node.
    volumesAttached: ?[]const root.io.k8s.api.core.v1.AttachedVolume = null,
    /// List of attachable volumes in use (mounted) by the node.
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

/// NodeSwapStatus represents swap memory information.
pub const NodeSwapStatus = struct {
    /// Total amount of swap memory in bytes.
    capacity: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// NodeSystemInfo is a set of ids/uuids to uniquely identify the node.
pub const NodeSystemInfo = struct {
    /// The Architecture reported by the node
    architecture: []const u8,
    /// Boot ID reported by the node.
    bootID: []const u8,
    /// ContainerRuntime Version reported by the node through runtime remote API (e.g. containerd://1.4.2).
    containerRuntimeVersion: []const u8,
    /// Kernel Version reported by the node from 'uname -r' (e.g. 3.16.0-0.bpo.4-amd64).
    kernelVersion: []const u8,
    /// Deprecated: KubeProxy Version reported by the node.
    kubeProxyVersion: []const u8,
    /// Kubelet Version reported by the node.
    kubeletVersion: []const u8,
    /// MachineID reported by the node. For unique machine identification in the cluster this field is preferred. Learn more from man(5) machine-id: http://man7.org/linux/man-pages/man5/machine-id.5.html
    machineID: []const u8,
    /// The Operating System reported by the node
    operatingSystem: []const u8,
    /// OS Image reported by the node from /etc/os-release (e.g. Debian GNU/Linux 7 (wheezy)).
    osImage: []const u8,
    /// Swap Info reported by the node.
    swap: ?root.io.k8s.api.core.v1.NodeSwapStatus = null,
    /// SystemUUID reported by the node. For unique machine identification MachineID is preferred. This field is specific to Red Hat hosts https://access.redhat.com/documentation/en-us/red_hat_subscription_management/1/html/rhsm/uuid
    systemUUID: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.swap) |v| try v.validate();
    }
};

/// ObjectFieldSelector selects an APIVersioned field of an object.
pub const ObjectFieldSelector = struct {
    /// Version of the schema the FieldPath is written in terms of, defaults to "v1".
    apiVersion: ?[]const u8 = null,
    /// Path of the field to select in the specified API version.
    fieldPath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ObjectReference contains enough information to let you inspect or modify the referred object.
pub const ObjectReference = struct {
    /// API version of the referent.
    apiVersion: ?[]const u8 = null,
    /// If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
    fieldPath: ?[]const u8 = null,
    /// Kind of the referent. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
    namespace: ?[]const u8 = null,
    /// Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
    resourceVersion: ?[]const u8 = null,
    /// UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
    uid: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PersistentVolume (PV) is a storage resource provisioned by an administrator. It is analogous to a node. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
pub const PersistentVolume = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines a specification of a persistent volume owned by the cluster. Provisioned by an administrator. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
    spec: ?root.io.k8s.api.core.v1.PersistentVolumeSpec = null,
    /// status represents the current information/status for the persistent volume. Populated by the system. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistent-volumes
    status: ?root.io.k8s.api.core.v1.PersistentVolumeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// PersistentVolumeClaim is a user's request for and claim to a persistent volume
pub const PersistentVolumeClaim = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// spec defines the desired characteristics of a volume requested by a pod author. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
    spec: ?root.io.k8s.api.core.v1.PersistentVolumeClaimSpec = null,
    /// status represents the current information/status of a persistent volume claim. Read-only. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
    status: ?root.io.k8s.api.core.v1.PersistentVolumeClaimStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// PersistentVolumeClaimCondition contains details about state of pvc
pub const PersistentVolumeClaimCondition = struct {
    /// lastProbeTime is the time we probed the condition.
    lastProbeTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// lastTransitionTime is the time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is the human-readable message indicating details about last transition.
    message: ?[]const u8 = null,
    /// reason is a unique, this should be a short, machine understandable string that gives the reason for condition's last transition. If it reports "Resizing" that means the underlying persistent volume is being resized.
    reason: ?[]const u8 = null,
    /// Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/persistent-volume-claim-v1/#:~:text=state%20of%20pvc-,conditions.status,-(string)%2C%20required
    status: []const u8,
    /// Type is the type of the condition. More info: https://kubernetes.io/docs/reference/kubernetes-api/config-and-storage-resources/persistent-volume-claim-v1/#:~:text=set%20to%20%27ResizeStarted%27.-,PersistentVolumeClaimCondition,-contains%20details%20about
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PersistentVolumeClaimList is a list of PersistentVolumeClaim items.
pub const PersistentVolumeClaimList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is a list of persistent volume claims. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
    items: []const root.io.k8s.api.core.v1.PersistentVolumeClaim,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PersistentVolumeClaimSpec describes the common attributes of storage devices and allows a Source for provider-specific attributes
pub const PersistentVolumeClaimSpec = struct {
    /// accessModes contains the desired access modes the volume should have. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
    accessModes: ?[]const []const u8 = null,
    /// dataSource field can be used to specify either: * An existing VolumeSnapshot object (snapshot.storage.k8s.io/VolumeSnapshot) * An existing PVC (PersistentVolumeClaim) If the provisioner or an external controller can support the specified data source, it will create a new volume based on the contents of the specified data source. When the AnyVolumeDataSource feature gate is enabled, dataSource contents will be copied to dataSourceRef, and dataSourceRef contents will be copied to dataSource when dataSourceRef.namespace is not specified. If the namespace is specified, then dataSourceRef will not be copied to dataSource.
    dataSource: ?root.io.k8s.api.core.v1.TypedLocalObjectReference = null,
    /// dataSourceRef specifies the object from which to populate the volume with data, if a non-empty volume is desired. This may be any object from a non-empty API group (non core object) or a PersistentVolumeClaim object. When this field is specified, volume binding will only succeed if the type of the specified object matches some installed volume populator or dynamic provisioner. This field will replace the functionality of the dataSource field and as such if both fields are non-empty, they must have the same value. For backwards compatibility, when namespace isn't specified in dataSourceRef, both fields (dataSource and dataSourceRef) will be set to the same value automatically if one of them is empty and the other is non-empty. When namespace is specified in dataSourceRef, dataSource isn't set to the same value and must be empty. There are three important differences between dataSource and dataSourceRef: * While dataSource only allows two specific types of objects, dataSourceRef
    ///   allows any non-core object, as well as PersistentVolumeClaim objects.
    /// * While dataSource ignores disallowed values (dropping them), dataSourceRef
    ///   preserves all values, and generates an error if a disallowed value is
    ///   specified.
    /// * While dataSource only allows local objects, dataSourceRef allows objects
    ///   in any namespaces.
    /// (Beta) Using this field requires the AnyVolumeDataSource feature gate to be enabled. (Alpha) Using the namespace field of dataSourceRef requires the CrossNamespaceVolumeDataSource feature gate to be enabled.
    dataSourceRef: ?root.io.k8s.api.core.v1.TypedObjectReference = null,
    /// resources represents the minimum resources the volume should have. Users are allowed to specify resource requirements that are lower than previous value but must still be higher than capacity recorded in the status field of the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#resources
    resources: ?root.io.k8s.api.core.v1.VolumeResourceRequirements = null,
    /// selector is a label query over volumes to consider for binding.
    selector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    /// storageClassName is the name of the StorageClass required by the claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#class-1
    storageClassName: ?[]const u8 = null,
    /// volumeAttributesClassName may be used to set the VolumeAttributesClass used by this claim. If specified, the CSI driver will create or update the volume with the attributes defined in the corresponding VolumeAttributesClass. This has a different purpose than storageClassName, it can be changed after the claim is created. An empty string or nil value indicates that no VolumeAttributesClass will be applied to the claim. If the claim enters an Infeasible error state, this field can be reset to its previous value (including nil) to cancel the modification. If the resource referred to by volumeAttributesClass does not exist, this PersistentVolumeClaim will be set to a Pending state, as reflected by the modifyVolumeStatus field, until such as a resource exists. More info: https://kubernetes.io/docs/concepts/storage/volume-attributes-classes/
    volumeAttributesClassName: ?[]const u8 = null,
    /// volumeMode defines what type of volume is required by the claim. Value of Filesystem is implied when not included in claim spec.
    volumeMode: ?[]const u8 = null,
    /// volumeName is the binding reference to the PersistentVolume backing this claim.
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.dataSource) |v| try v.validate();
        if (self.dataSourceRef) |v| try v.validate();
        if (self.resources) |v| try v.validate();
        if (self.selector) |v| try v.validate();
    }
};

/// PersistentVolumeClaimStatus is the current status of a persistent volume claim.
pub const PersistentVolumeClaimStatus = struct {
    /// accessModes contains the actual access modes the volume backing the PVC has. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes-1
    accessModes: ?[]const []const u8 = null,
    /// allocatedResourceStatuses stores status of resource being resized for the given PVC. Key names follow standard Kubernetes label syntax. Valid values are either:
    /// 	* Un-prefixed keys:
    /// 		- storage - the capacity of the volume.
    /// 	* Custom resources must use implementation-defined prefixed names such as "example.com/my-custom-resource"
    /// Apart from above values - keys that are unprefixed or have kubernetes.io prefix are considered reserved and hence may not be used.
    /// 
    /// ClaimResourceStatus can be in any of following states:
    /// 	- ControllerResizeInProgress:
    /// 		State set when resize controller starts resizing the volume in control-plane.
    /// 	- ControllerResizeFailed:
    /// 		State set when resize has failed in resize controller with a terminal error.
    /// 	- NodeResizePending:
    /// 		State set when resize controller has finished resizing the volume but further resizing of
    /// 		volume is needed on the node.
    /// 	- NodeResizeInProgress:
    /// 		State set when kubelet starts resizing the volume.
    /// 	- NodeResizeFailed:
    /// 		State set when resizing has failed in kubelet with a terminal error. Transient errors don't set
    /// 		NodeResizeFailed.
    /// For example: if expanding a PVC for more capacity - this field can be one of the following states:
    /// 	- pvc.status.allocatedResourceStatus['storage'] = "ControllerResizeInProgress"
    ///      - pvc.status.allocatedResourceStatus['storage'] = "ControllerResizeFailed"
    ///      - pvc.status.allocatedResourceStatus['storage'] = "NodeResizePending"
    ///      - pvc.status.allocatedResourceStatus['storage'] = "NodeResizeInProgress"
    ///      - pvc.status.allocatedResourceStatus['storage'] = "NodeResizeFailed"
    /// When this field is not set, it means that no resize operation is in progress for the given PVC.
    /// 
    /// A controller that receives PVC update with previously unknown resourceName or ClaimResourceStatus should ignore the update for the purpose it was designed. For example - a controller that only is responsible for resizing capacity of the volume, should ignore PVC updates that change other valid resources associated with PVC.
    allocatedResourceStatuses: ?std.json.Value = null,
    /// allocatedResources tracks the resources allocated to a PVC including its capacity. Key names follow standard Kubernetes label syntax. Valid values are either:
    /// 	* Un-prefixed keys:
    /// 		- storage - the capacity of the volume.
    /// 	* Custom resources must use implementation-defined prefixed names such as "example.com/my-custom-resource"
    /// Apart from above values - keys that are unprefixed or have kubernetes.io prefix are considered reserved and hence may not be used.
    /// 
    /// Capacity reported here may be larger than the actual capacity when a volume expansion operation is requested. For storage quota, the larger value from allocatedResources and PVC.spec.resources is used. If allocatedResources is not set, PVC.spec.resources alone is used for quota calculation. If a volume expansion capacity request is lowered, allocatedResources is only lowered if there are no expansion operations in progress and if the actual volume capacity is equal or lower than the requested capacity.
    /// 
    /// A controller that receives PVC update with previously unknown resourceName should ignore the update for the purpose it was designed. For example - a controller that only is responsible for resizing capacity of the volume, should ignore PVC updates that change other valid resources associated with PVC.
    allocatedResources: ?std.json.Value = null,
    /// capacity represents the actual resources of the underlying volume.
    capacity: ?std.json.Value = null,
    /// conditions is the current Condition of persistent volume claim. If underlying persistent volume is being resized then the Condition will be set to 'Resizing'.
    conditions: ?[]const root.io.k8s.api.core.v1.PersistentVolumeClaimCondition = null,
    /// currentVolumeAttributesClassName is the current name of the VolumeAttributesClass the PVC is using. When unset, there is no VolumeAttributeClass applied to this PersistentVolumeClaim
    currentVolumeAttributesClassName: ?[]const u8 = null,
    /// ModifyVolumeStatus represents the status object of ControllerModifyVolume operation. When this is unset, there is no ModifyVolume operation being attempted.
    modifyVolumeStatus: ?root.io.k8s.api.core.v1.ModifyVolumeStatus = null,
    /// phase represents the current phase of PersistentVolumeClaim.
    phase: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.modifyVolumeStatus) |v| try v.validate();
    }
};

/// PersistentVolumeClaimTemplate is used to produce PersistentVolumeClaim objects as part of an EphemeralVolumeSource.
pub const PersistentVolumeClaimTemplate = struct {
    /// May contain labels and annotations that will be copied into the PVC when creating it. No other fields are allowed and will be rejected during validation.
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// The specification for the PersistentVolumeClaim. The entire content is copied unchanged into the PVC that gets created from this template. The same fields as in a PersistentVolumeClaim are also valid here.
    spec: root.io.k8s.api.core.v1.PersistentVolumeClaimSpec,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
    }
};

/// PersistentVolumeClaimVolumeSource references the user's PVC in the same namespace. This volume finds the bound PV and mounts that volume for the pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper around another type of volume that is owned by someone else (the system).
pub const PersistentVolumeClaimVolumeSource = struct {
    /// claimName is the name of a PersistentVolumeClaim in the same namespace as the pod using this volume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
    claimName: []const u8,
    /// readOnly Will force the ReadOnly setting in VolumeMounts. Default false.
    readOnly: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PersistentVolumeList is a list of PersistentVolume items.
pub const PersistentVolumeList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// items is a list of persistent volumes. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes
    items: []const root.io.k8s.api.core.v1.PersistentVolume,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PersistentVolumeSpec is the specification of a persistent volume.
pub const PersistentVolumeSpec = struct {
    /// accessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
    accessModes: ?[]const []const u8 = null,
    /// awsElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Deprecated: AWSElasticBlockStore is deprecated. All operations for the in-tree awsElasticBlockStore type are redirected to the ebs.csi.aws.com CSI driver. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
    awsElasticBlockStore: ?root.io.k8s.api.core.v1.AWSElasticBlockStoreVolumeSource = null,
    /// azureDisk represents an Azure Data Disk mount on the host and bind mount to the pod. Deprecated: AzureDisk is deprecated. All operations for the in-tree azureDisk type are redirected to the disk.csi.azure.com CSI driver.
    azureDisk: ?root.io.k8s.api.core.v1.AzureDiskVolumeSource = null,
    /// azureFile represents an Azure File Service mount on the host and bind mount to the pod. Deprecated: AzureFile is deprecated. All operations for the in-tree azureFile type are redirected to the file.csi.azure.com CSI driver.
    azureFile: ?root.io.k8s.api.core.v1.AzureFilePersistentVolumeSource = null,
    /// capacity is the description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
    capacity: ?std.json.Value = null,
    /// cephFS represents a Ceph FS mount on the host that shares a pod's lifetime. Deprecated: CephFS is deprecated and the in-tree cephfs type is no longer supported.
    cephfs: ?root.io.k8s.api.core.v1.CephFSPersistentVolumeSource = null,
    /// cinder represents a cinder volume attached and mounted on kubelets host machine. Deprecated: Cinder is deprecated. All operations for the in-tree cinder type are redirected to the cinder.csi.openstack.org CSI driver. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    cinder: ?root.io.k8s.api.core.v1.CinderPersistentVolumeSource = null,
    /// claimRef is part of a bi-directional binding between PersistentVolume and PersistentVolumeClaim. Expected to be non-nil when bound. claim.VolumeName is the authoritative bind between PV and PVC. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#binding
    claimRef: ?root.io.k8s.api.core.v1.ObjectReference = null,
    /// csi represents storage that is handled by an external CSI driver.
    csi: ?root.io.k8s.api.core.v1.CSIPersistentVolumeSource = null,
    /// fc represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod.
    fc: ?root.io.k8s.api.core.v1.FCVolumeSource = null,
    /// flexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin. Deprecated: FlexVolume is deprecated. Consider using a CSIDriver instead.
    flexVolume: ?root.io.k8s.api.core.v1.FlexPersistentVolumeSource = null,
    /// flocker represents a Flocker volume attached to a kubelet's host machine and exposed to the pod for its usage. This depends on the Flocker control service being running. Deprecated: Flocker is deprecated and the in-tree flocker type is no longer supported.
    flocker: ?root.io.k8s.api.core.v1.FlockerVolumeSource = null,
    /// gcePersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Provisioned by an admin. Deprecated: GCEPersistentDisk is deprecated. All operations for the in-tree gcePersistentDisk type are redirected to the pd.csi.storage.gke.io CSI driver. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    gcePersistentDisk: ?root.io.k8s.api.core.v1.GCEPersistentDiskVolumeSource = null,
    /// glusterfs represents a Glusterfs volume that is attached to a host and exposed to the pod. Provisioned by an admin. Deprecated: Glusterfs is deprecated and the in-tree glusterfs type is no longer supported. More info: https://examples.k8s.io/volumes/glusterfs/README.md
    glusterfs: ?root.io.k8s.api.core.v1.GlusterfsPersistentVolumeSource = null,
    /// hostPath represents a directory on the host. Provisioned by a developer or tester. This is useful for single-node development and testing only! On-host storage is not supported in any way and WILL NOT WORK in a multi-node cluster. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    hostPath: ?root.io.k8s.api.core.v1.HostPathVolumeSource = null,
    /// iscsi represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Provisioned by an admin.
    iscsi: ?root.io.k8s.api.core.v1.ISCSIPersistentVolumeSource = null,
    /// local represents directly-attached storage with node affinity
    local: ?root.io.k8s.api.core.v1.LocalVolumeSource = null,
    /// mountOptions is the list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
    mountOptions: ?[]const []const u8 = null,
    /// nfs represents an NFS mount on the host. Provisioned by an admin. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
    nfs: ?root.io.k8s.api.core.v1.NFSVolumeSource = null,
    /// nodeAffinity defines constraints that limit what nodes this volume can be accessed from. This field influences the scheduling of pods that use this volume. This field is mutable if MutablePVNodeAffinity feature gate is enabled.
    nodeAffinity: ?root.io.k8s.api.core.v1.VolumeNodeAffinity = null,
    /// persistentVolumeReclaimPolicy defines what happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
    persistentVolumeReclaimPolicy: ?[]const u8 = null,
    /// photonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine. Deprecated: PhotonPersistentDisk is deprecated and the in-tree photonPersistentDisk type is no longer supported.
    photonPersistentDisk: ?root.io.k8s.api.core.v1.PhotonPersistentDiskVolumeSource = null,
    /// portworxVolume represents a portworx volume attached and mounted on kubelets host machine. Deprecated: PortworxVolume is deprecated. All operations for the in-tree portworxVolume type are redirected to the pxd.portworx.com CSI driver when the CSIMigrationPortworx feature-gate is on.
    portworxVolume: ?root.io.k8s.api.core.v1.PortworxVolumeSource = null,
    /// quobyte represents a Quobyte mount on the host that shares a pod's lifetime. Deprecated: Quobyte is deprecated and the in-tree quobyte type is no longer supported.
    quobyte: ?root.io.k8s.api.core.v1.QuobyteVolumeSource = null,
    /// rbd represents a Rados Block Device mount on the host that shares a pod's lifetime. Deprecated: RBD is deprecated and the in-tree rbd type is no longer supported. More info: https://examples.k8s.io/volumes/rbd/README.md
    rbd: ?root.io.k8s.api.core.v1.RBDPersistentVolumeSource = null,
    /// scaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes. Deprecated: ScaleIO is deprecated and the in-tree scaleIO type is no longer supported.
    scaleIO: ?root.io.k8s.api.core.v1.ScaleIOPersistentVolumeSource = null,
    /// storageClassName is the name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
    storageClassName: ?[]const u8 = null,
    /// storageOS represents a StorageOS volume that is attached to the kubelet's host machine and mounted into the pod. Deprecated: StorageOS is deprecated and the in-tree storageos type is no longer supported. More info: https://examples.k8s.io/volumes/storageos/README.md
    storageos: ?root.io.k8s.api.core.v1.StorageOSPersistentVolumeSource = null,
    /// Name of VolumeAttributesClass to which this persistent volume belongs. Empty value is not allowed. When this field is not set, it indicates that this volume does not belong to any VolumeAttributesClass. This field is mutable and can be changed by the CSI driver after a volume has been updated successfully to a new class. For an unbound PersistentVolume, the volumeAttributesClassName will be matched with unbound PersistentVolumeClaims during the binding process.
    volumeAttributesClassName: ?[]const u8 = null,
    /// volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec.
    volumeMode: ?[]const u8 = null,
    /// vsphereVolume represents a vSphere volume attached and mounted on kubelets host machine. Deprecated: VsphereVolume is deprecated. All operations for the in-tree vsphereVolume type are redirected to the csi.vsphere.vmware.com CSI driver.
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

/// PersistentVolumeStatus is the current status of a persistent volume.
pub const PersistentVolumeStatus = struct {
    /// lastPhaseTransitionTime is the time the phase transitioned from one to another and automatically resets to current time everytime a volume phase transitions.
    lastPhaseTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// message is a human-readable message indicating details about why the volume is in this state.
    message: ?[]const u8 = null,
    /// phase indicates if a volume is available, bound to a claim, or released by a claim. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#phase
    phase: ?[]const u8 = null,
    /// reason is a brief CamelCase string that describes any failure and is meant for machine parsing and tidy display in the CLI.
    reason: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Photon Controller persistent disk resource.
pub const PhotonPersistentDiskVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// pdID is the ID that identifies Photon Controller persistent disk
    pdID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Pod is a collection of containers that can run on a host. This resource is created by clients and scheduled onto hosts.
pub const Pod = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.PodSpec = null,
    /// Most recently observed status of the pod. This data may not be up to date. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.PodStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// Pod affinity is a group of inter pod affinity scheduling rules.
pub const PodAffinity = struct {
    /// The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.WeightedPodAffinityTerm = null,
    /// If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
    requiredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PodAffinityTerm = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
    }
};

/// Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running
pub const PodAffinityTerm = struct {
    /// A label query over a set of resources, in this case pods. If it's null, this PodAffinityTerm matches with no Pods.
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    /// MatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration. The keys are used to lookup values from the incoming pod labels, those key-value labels are merged with `labelSelector` as `key in (value)` to select the group of existing pods which pods will be taken into consideration for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The default value is empty. The same key is forbidden to exist in both matchLabelKeys and labelSelector. Also, matchLabelKeys cannot be set when labelSelector isn't set.
    matchLabelKeys: ?[]const []const u8 = null,
    /// MismatchLabelKeys is a set of pod label keys to select which pods will be taken into consideration. The keys are used to lookup values from the incoming pod labels, those key-value labels are merged with `labelSelector` as `key notin (value)` to select the group of existing pods which pods will be taken into consideration for the incoming pod's pod (anti) affinity. Keys that don't exist in the incoming pod labels will be ignored. The default value is empty. The same key is forbidden to exist in both mismatchLabelKeys and labelSelector. Also, mismatchLabelKeys cannot be set when labelSelector isn't set.
    mismatchLabelKeys: ?[]const []const u8 = null,
    /// A label query over the set of namespaces that the term applies to. The term is applied to the union of the namespaces selected by this field and the ones listed in the namespaces field. null selector and null or empty namespaces list means "this pod's namespace". An empty selector ({}) matches all namespaces.
    namespaceSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    /// namespaces specifies a static list of namespace names that the term applies to. The term is applied to the union of the namespaces listed in this field and the ones selected by namespaceSelector. null or empty namespaces list and null namespaceSelector means "this pod's namespace".
    namespaces: ?[]const []const u8 = null,
    /// This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed.
    topologyKey: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
        if (self.namespaceSelector) |v| try v.validate();
    }
};

/// Pod anti affinity is a group of inter pod anti affinity scheduling rules.
pub const PodAntiAffinity = struct {
    /// The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and subtracting "weight" from the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
    preferredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.WeightedPodAffinityTerm = null,
    /// If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
    requiredDuringSchedulingIgnoredDuringExecution: ?[]const root.io.k8s.api.core.v1.PodAffinityTerm = null,

    pub fn validate(self: @This()) !void {
        if (self.preferredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
        if (self.requiredDuringSchedulingIgnoredDuringExecution) |arr| for (arr) |item| try item.validate();
    }
};

/// PodCertificateProjection provides a private key and X.509 certificate in the pod filesystem.
pub const PodCertificateProjection = struct {
    /// Write the certificate chain at this path in the projected volume.
    /// 
    /// Most applications should use credentialBundlePath.  When using keyPath and certificateChainPath, your application needs to check that the key and leaf certificate are consistent, because it is possible to read the files mid-rotation.
    certificateChainPath: ?[]const u8 = null,
    /// Write the credential bundle at this path in the projected volume.
    /// 
    /// The credential bundle is a single file that contains multiple PEM blocks. The first PEM block is a PRIVATE KEY block, containing a PKCS#8 private key.
    /// 
    /// The remaining blocks are CERTIFICATE blocks, containing the issued certificate chain from the signer (leaf and any intermediates).
    /// 
    /// Using credentialBundlePath lets your Pod's application code make a single atomic read that retrieves a consistent key and certificate chain.  If you project them to separate files, your application code will need to additionally check that the leaf certificate was issued to the key.
    credentialBundlePath: ?[]const u8 = null,
    /// Write the key at this path in the projected volume.
    /// 
    /// Most applications should use credentialBundlePath.  When using keyPath and certificateChainPath, your application needs to check that the key and leaf certificate are consistent, because it is possible to read the files mid-rotation.
    keyPath: ?[]const u8 = null,
    /// The type of keypair Kubelet will generate for the pod.
    /// 
    /// Valid values are "RSA3072", "RSA4096", "ECDSAP256", "ECDSAP384", "ECDSAP521", and "ED25519".
    keyType: []const u8,
    /// maxExpirationSeconds is the maximum lifetime permitted for the certificate.
    /// 
    /// Kubelet copies this value verbatim into the PodCertificateRequests it generates for this projection.
    /// 
    /// If omitted, kube-apiserver will set it to 86400(24 hours). kube-apiserver will reject values shorter than 3600 (1 hour).  The maximum allowable value is 7862400 (91 days).
    /// 
    /// The signer implementation is then free to issue a certificate with any lifetime *shorter* than MaxExpirationSeconds, but no shorter than 3600 seconds (1 hour).  This constraint is enforced by kube-apiserver. `kubernetes.io` signers will never issue certificates with a lifetime longer than 24 hours.
    maxExpirationSeconds: ?i64 = null,
    /// Kubelet's generated CSRs will be addressed to this signer.
    signerName: []const u8,
    /// userAnnotations allow pod authors to pass additional information to the signer implementation.  Kubernetes does not restrict or validate this metadata in any way.
    /// 
    /// These values are copied verbatim into the `spec.unverifiedUserAnnotations` field of the PodCertificateRequest objects that Kubelet creates.
    /// 
    /// Entries are subject to the same validation as object metadata annotations, with the addition that all keys must be domain-prefixed. No restrictions are placed on values, except an overall size limitation on the entire field.
    /// 
    /// Signers should document the keys and values they support. Signers should deny requests that contain keys they do not recognize.
    userAnnotations: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodCondition contains details for the current condition of this pod.
pub const PodCondition = struct {
    /// Last time we probed the condition.
    lastProbeTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// Human-readable message indicating details about last transition.
    message: ?[]const u8 = null,
    /// If set, this represents the .metadata.generation that the pod condition was set based upon. The PodObservedGenerationTracking feature gate must be enabled to use this field.
    observedGeneration: ?i64 = null,
    /// Unique, one-word, CamelCase reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// Status is the status of the condition. Can be True, False, Unknown. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
    status: []const u8,
    /// Type is the type of the condition. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodDNSConfig defines the DNS parameters of a pod in addition to those generated from DNSPolicy.
pub const PodDNSConfig = struct {
    /// A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
    nameservers: ?[]const []const u8 = null,
    /// A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
    options: ?[]const root.io.k8s.api.core.v1.PodDNSConfigOption = null,
    /// A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
    searches: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.options) |arr| for (arr) |item| try item.validate();
    }
};

/// PodDNSConfigOption defines DNS resolver options of a pod.
pub const PodDNSConfigOption = struct {
    /// Name is this DNS resolver option's name. Required.
    name: ?[]const u8 = null,
    /// Value is this DNS resolver option's value.
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodExtendedResourceClaimStatus is stored in the PodStatus for the extended resource requests backed by DRA. It stores the generated name for the corresponding special ResourceClaim created by the scheduler.
pub const PodExtendedResourceClaimStatus = struct {
    /// RequestMappings identifies the mapping of <container, extended resource backed by DRA> to  device request in the generated ResourceClaim.
    requestMappings: []const root.io.k8s.api.core.v1.ContainerExtendedResourceRequest,
    /// ResourceClaimName is the name of the ResourceClaim that was generated for the Pod in the namespace of the Pod.
    resourceClaimName: []const u8,

    pub fn validate(self: @This()) !void {
        for (self.requestMappings) |item| try item.validate();
    }
};

/// PodIP represents a single IP address allocated to the pod.
pub const PodIP = struct {
    /// IP is the IP address assigned to the pod
    ip: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodList is a list of Pods.
pub const PodList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of pods. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md
    items: []const root.io.k8s.api.core.v1.Pod,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PodOS defines the OS parameters of a pod.
pub const PodOS = struct {
    /// Name is the name of the operating system. The currently supported values are linux and windows. Additional value may be defined in future and can be one of: https://github.com/opencontainers/runtime-spec/blob/master/config.md#platform-specific-configuration Clients should expect to handle additional values and treat unrecognized values in this field as os: null
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodReadinessGate contains the reference to a pod condition
pub const PodReadinessGate = struct {
    /// ConditionType refers to a condition in the pod's condition list with matching type.
    conditionType: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodResourceClaim references exactly one ResourceClaim, either directly or by naming a ResourceClaimTemplate which is then turned into a ResourceClaim for the pod.
/// 
/// It adds a name to it that uniquely identifies the ResourceClaim inside the Pod. Containers that need access to the ResourceClaim reference it with this name.
pub const PodResourceClaim = struct {
    /// Name uniquely identifies this resource claim inside the pod. This must be a DNS_LABEL.
    name: []const u8,
    /// ResourceClaimName is the name of a ResourceClaim object in the same namespace as this pod.
    /// 
    /// Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
    resourceClaimName: ?[]const u8 = null,
    /// ResourceClaimTemplateName is the name of a ResourceClaimTemplate object in the same namespace as this pod.
    /// 
    /// The template will be used to create a new ResourceClaim, which will be bound to this pod. When this pod is deleted, the ResourceClaim will also be deleted. The pod name and resource name, along with a generated component, will be used to form a unique name for the ResourceClaim, which will be recorded in pod.status.resourceClaimStatuses.
    /// 
    /// This field is immutable and no changes will be made to the corresponding ResourceClaim by the control plane after creating the ResourceClaim.
    /// 
    /// Exactly one of ResourceClaimName and ResourceClaimTemplateName must be set.
    resourceClaimTemplateName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodResourceClaimStatus is stored in the PodStatus for each PodResourceClaim which references a ResourceClaimTemplate. It stores the generated name for the corresponding ResourceClaim.
pub const PodResourceClaimStatus = struct {
    /// Name uniquely identifies this resource claim inside the pod. This must match the name of an entry in pod.spec.resourceClaims, which implies that the string must be a DNS_LABEL.
    name: []const u8,
    /// ResourceClaimName is the name of the ResourceClaim that was generated for the Pod in the namespace of the Pod. If this is unset, then generating a ResourceClaim was not necessary. The pod.spec.resourceClaims entry can be ignored in this case.
    resourceClaimName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodSchedulingGate is associated to a Pod to guard its scheduling.
pub const PodSchedulingGate = struct {
    /// Name of the scheduling gate. Each scheduling gate must have a unique name field.
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PodSecurityContext holds pod-level security attributes and common container settings. Some fields are also present in container.securityContext.  Field values of container.securityContext take precedence over field values of PodSecurityContext.
pub const PodSecurityContext = struct {
    /// appArmorProfile is the AppArmor options to use by the containers in this pod. Note that this field cannot be set when spec.os.name is windows.
    appArmorProfile: ?root.io.k8s.api.core.v1.AppArmorProfile = null,
    /// A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod:
    /// 
    /// 1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw----
    /// 
    /// If unset, the Kubelet will not modify the ownership and permissions of any volume. Note that this field cannot be set when spec.os.name is windows.
    fsGroup: ?i64 = null,
    /// fsGroupChangePolicy defines behavior of changing ownership and permission of the volume before being exposed inside Pod. This field will only apply to volume types which support fsGroup based ownership(and permissions). It will have no effect on ephemeral volume types such as: secret, configmaps and emptydir. Valid values are "OnRootMismatch" and "Always". If not specified, "Always" is used. Note that this field cannot be set when spec.os.name is windows.
    fsGroupChangePolicy: ?[]const u8 = null,
    /// The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container. Note that this field cannot be set when spec.os.name is windows.
    runAsGroup: ?i64 = null,
    /// Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
    runAsNonRoot: ?bool = null,
    /// The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container. Note that this field cannot be set when spec.os.name is windows.
    runAsUser: ?i64 = null,
    /// seLinuxChangePolicy defines how the container's SELinux label is applied to all volumes used by the Pod. It has no effect on nodes that do not support SELinux or to volumes does not support SELinux. Valid values are "MountOption" and "Recursive".
    /// 
    /// "Recursive" means relabeling of all files on all Pod volumes by the container runtime. This may be slow for large volumes, but allows mixing privileged and unprivileged Pods sharing the same volume on the same node.
    /// 
    /// "MountOption" mounts all eligible Pod volumes with `-o context` mount option. This requires all Pods that share the same volume to use the same SELinux label. It is not possible to share the same volume among privileged and unprivileged Pods. Eligible volumes are in-tree FibreChannel and iSCSI volumes, and all CSI volumes whose CSI driver announces SELinux support by setting spec.seLinuxMount: true in their CSIDriver instance. Other volumes are always re-labelled recursively. "MountOption" value is allowed only when SELinuxMount feature gate is enabled.
    /// 
    /// If not specified and SELinuxMount feature gate is enabled, "MountOption" is used. If not specified and SELinuxMount feature gate is disabled, "MountOption" is used for ReadWriteOncePod volumes and "Recursive" for all other volumes.
    /// 
    /// This field affects only Pods that have SELinux label set, either in PodSecurityContext or in SecurityContext of all containers.
    /// 
    /// All Pods that use the same volume should use the same seLinuxChangePolicy, otherwise some pods can get stuck in ContainerCreating state. Note that this field cannot be set when spec.os.name is windows.
    seLinuxChangePolicy: ?[]const u8 = null,
    /// The SELinux context to be applied to all containers. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container. Note that this field cannot be set when spec.os.name is windows.
    seLinuxOptions: ?root.io.k8s.api.core.v1.SELinuxOptions = null,
    /// The seccomp options to use by the containers in this pod. Note that this field cannot be set when spec.os.name is windows.
    seccompProfile: ?root.io.k8s.api.core.v1.SeccompProfile = null,
    /// A list of groups applied to the first process run in each container, in addition to the container's primary GID and fsGroup (if specified).  If the SupplementalGroupsPolicy feature is enabled, the supplementalGroupsPolicy field determines whether these are in addition to or instead of any group memberships defined in the container image. If unspecified, no additional groups are added, though group memberships defined in the container image may still be used, depending on the supplementalGroupsPolicy field. Note that this field cannot be set when spec.os.name is windows.
    supplementalGroups: ?[]const i64 = null,
    /// Defines how supplemental groups of the first container processes are calculated. Valid values are "Merge" and "Strict". If not specified, "Merge" is used. (Alpha) Using the field requires the SupplementalGroupsPolicy feature gate to be enabled and the container runtime must implement support for this feature. Note that this field cannot be set when spec.os.name is windows.
    supplementalGroupsPolicy: ?[]const u8 = null,
    /// Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch. Note that this field cannot be set when spec.os.name is windows.
    sysctls: ?[]const root.io.k8s.api.core.v1.Sysctl = null,
    /// The Windows specific settings applied to all containers. If unspecified, the options within a container's SecurityContext will be used. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is linux.
    windowsOptions: ?root.io.k8s.api.core.v1.WindowsSecurityContextOptions = null,

    pub fn validate(self: @This()) !void {
        if (self.appArmorProfile) |v| try v.validate();
        if (self.seLinuxOptions) |v| try v.validate();
        if (self.seccompProfile) |v| try v.validate();
        if (self.sysctls) |arr| for (arr) |item| try item.validate();
        if (self.windowsOptions) |v| try v.validate();
    }
};

/// PodSpec is a description of a pod.
pub const PodSpec = struct {
    /// Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.
    activeDeadlineSeconds: ?i64 = null,
    /// If specified, the pod's scheduling constraints
    affinity: ?root.io.k8s.api.core.v1.Affinity = null,
    /// AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.
    automountServiceAccountToken: ?bool = null,
    /// List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.
    containers: []const root.io.k8s.api.core.v1.Container,
    /// Specifies the DNS parameters of a pod. Parameters specified here will be merged to the generated DNS configuration based on DNSPolicy.
    dnsConfig: ?root.io.k8s.api.core.v1.PodDNSConfig = null,
    /// Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'.
    dnsPolicy: ?[]const u8 = null,
    /// EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. Optional: Defaults to true.
    enableServiceLinks: ?bool = null,
    /// List of ephemeral containers run in this pod. Ephemeral containers may be run in an existing pod to perform user-initiated actions such as debugging. This list cannot be specified when creating a pod, and it cannot be modified by updating the pod spec. In order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers subresource.
    ephemeralContainers: ?[]const root.io.k8s.api.core.v1.EphemeralContainer = null,
    /// HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified.
    hostAliases: ?[]const root.io.k8s.api.core.v1.HostAlias = null,
    /// Use the host's ipc namespace. Optional: Default to false.
    hostIPC: ?bool = null,
    /// Host networking requested for this pod. Use the host's network namespace. When using HostNetwork you should specify ports so the scheduler is aware. When `hostNetwork` is true, specified `hostPort` fields in port definitions must match `containerPort`, and unspecified `hostPort` fields in port definitions are defaulted to match `containerPort`. Default to false.
    hostNetwork: ?bool = null,
    /// Use the host's pid namespace. Optional: Default to false.
    hostPID: ?bool = null,
    /// Use the host's user namespace. Optional: Default to true. If set to true or not present, the pod will be run in the host user namespace, useful for when the pod needs a feature only available to the host user namespace, such as loading a kernel module with CAP_SYS_MODULE. When set to false, a new userns is created for the pod. Setting false is useful for mitigating container breakout vulnerabilities even allowing users to run their containers as root without actually having root privileges on the host. This field is alpha-level and is only honored by servers that enable the UserNamespacesSupport feature.
    hostUsers: ?bool = null,
    /// Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.
    hostname: ?[]const u8 = null,
    /// HostnameOverride specifies an explicit override for the pod's hostname as perceived by the pod. This field only specifies the pod's hostname and does not affect its DNS records. When this field is set to a non-empty string: - It takes precedence over the values set in `hostname` and `subdomain`. - The Pod's hostname will be set to this value. - `setHostnameAsFQDN` must be nil or set to false. - `hostNetwork` must be set to false.
    /// 
    /// This field must be a valid DNS subdomain as defined in RFC 1123 and contain at most 64 characters. Requires the HostnameOverride feature gate to be enabled.
    hostnameOverride: ?[]const u8 = null,
    /// ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
    imagePullSecrets: ?[]const root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
    initContainers: ?[]const root.io.k8s.api.core.v1.Container = null,
    /// NodeName indicates in which node this pod is scheduled. If empty, this pod is a candidate for scheduling by the scheduler defined in schedulerName. Once this field is set, the kubelet for this node becomes responsible for the lifecycle of this pod. This field should not be used to express a desire for the pod to be scheduled on a specific node. https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodename
    nodeName: ?[]const u8 = null,
    /// NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
    nodeSelector: ?std.json.Value = null,
    /// Specifies the OS of the containers in the pod. Some pod and container fields are restricted if this is set.
    /// 
    /// If the OS field is set to linux, the following fields must be unset: -securityContext.windowsOptions
    /// 
    /// If the OS field is set to windows, following fields must be unset: - spec.hostPID - spec.hostIPC - spec.hostUsers - spec.resources - spec.securityContext.appArmorProfile - spec.securityContext.seLinuxOptions - spec.securityContext.seccompProfile - spec.securityContext.fsGroup - spec.securityContext.fsGroupChangePolicy - spec.securityContext.sysctls - spec.shareProcessNamespace - spec.securityContext.runAsUser - spec.securityContext.runAsGroup - spec.securityContext.supplementalGroups - spec.securityContext.supplementalGroupsPolicy - spec.containers[*].securityContext.appArmorProfile - spec.containers[*].securityContext.seLinuxOptions - spec.containers[*].securityContext.seccompProfile - spec.containers[*].securityContext.capabilities - spec.containers[*].securityContext.readOnlyRootFilesystem - spec.containers[*].securityContext.privileged - spec.containers[*].securityContext.allowPrivilegeEscalation - spec.containers[*].securityContext.procMount - spec.containers[*].securityContext.runAsUser - spec.containers[*].securityContext.runAsGroup
    os: ?root.io.k8s.api.core.v1.PodOS = null,
    /// Overhead represents the resource overhead associated with running a pod for a given RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass admission controller. If the RuntimeClass admission controller is enabled, overhead must not be set in Pod create requests. The RuntimeClass admission controller will reject Pod create requests which have the overhead already set. If RuntimeClass is configured and selected in the PodSpec, Overhead will be set to the value defined in the corresponding RuntimeClass, otherwise it will remain unset and treated as zero. More info: https://git.k8s.io/enhancements/keps/sig-node/688-pod-overhead/README.md
    overhead: ?std.json.Value = null,
    /// PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset.
    preemptionPolicy: ?[]const u8 = null,
    /// The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority.
    priority: ?i64 = null,
    /// If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.
    priorityClassName: ?[]const u8 = null,
    /// If specified, all readiness gates will be evaluated for pod readiness. A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to "True" More info: https://git.k8s.io/enhancements/keps/sig-network/580-pod-readiness-gates
    readinessGates: ?[]const root.io.k8s.api.core.v1.PodReadinessGate = null,
    /// ResourceClaims defines which ResourceClaims must be allocated and reserved before the Pod is allowed to start. The resources will be made available to those containers which consume them by name.
    /// 
    /// This is a stable field but requires that the DynamicResourceAllocation feature gate is enabled.
    /// 
    /// This field is immutable.
    resourceClaims: ?[]const root.io.k8s.api.core.v1.PodResourceClaim = null,
    /// Resources is the total amount of CPU and Memory resources required by all containers in the pod. It supports specifying Requests and Limits for "cpu", "memory" and "hugepages-" resource names only. ResourceClaims are not supported.
    /// 
    /// This field enables fine-grained control over resource allocation for the entire pod, allowing resource sharing among containers in a pod.
    /// 
    /// This is an alpha field and requires enabling the PodLevelResources feature gate.
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    /// Restart policy for all containers within the pod. One of Always, OnFailure, Never. In some contexts, only a subset of those values may be permitted. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
    restartPolicy: ?[]const u8 = null,
    /// RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should be used to run this pod.  If no RuntimeClass resource matches the named class, the pod will not be run. If unset or empty, the "legacy" RuntimeClass will be used, which is an implicit class with an empty definition that uses the default runtime handler. More info: https://git.k8s.io/enhancements/keps/sig-node/585-runtime-class
    runtimeClassName: ?[]const u8 = null,
    /// If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler.
    schedulerName: ?[]const u8 = null,
    /// SchedulingGates is an opaque list of values that if specified will block scheduling the pod. If schedulingGates is not empty, the pod will stay in the SchedulingGated state and the scheduler will not attempt to schedule the pod.
    /// 
    /// SchedulingGates can only be set at pod creation time, and be removed only afterwards.
    schedulingGates: ?[]const root.io.k8s.api.core.v1.PodSchedulingGate = null,
    /// SecurityContext holds pod-level security attributes and common container settings. Optional: Defaults to empty.  See type description for default values of each field.
    securityContext: ?root.io.k8s.api.core.v1.PodSecurityContext = null,
    /// DeprecatedServiceAccount is a deprecated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead.
    serviceAccount: ?[]const u8 = null,
    /// ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
    serviceAccountName: ?[]const u8 = null,
    /// If true the pod's hostname will be configured as the pod's FQDN, rather than the leaf name (the default). In Linux containers, this means setting the FQDN in the hostname field of the kernel (the nodename field of struct utsname). In Windows containers, this means setting the registry value of hostname for the registry key HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\Tcpip\\Parameters to FQDN. If a pod does not have FQDN, this has no effect. Default to false.
    setHostnameAsFQDN: ?bool = null,
    /// Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Default to false.
    shareProcessNamespace: ?bool = null,
    /// If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>". If not specified, the pod will not have a domainname at all.
    subdomain: ?[]const u8 = null,
    /// Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds.
    terminationGracePeriodSeconds: ?i64 = null,
    /// If specified, the pod's tolerations.
    tolerations: ?[]const root.io.k8s.api.core.v1.Toleration = null,
    /// TopologySpreadConstraints describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints. All topologySpreadConstraints are ANDed.
    topologySpreadConstraints: ?[]const root.io.k8s.api.core.v1.TopologySpreadConstraint = null,
    /// List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes
    volumes: ?[]const root.io.k8s.api.core.v1.Volume = null,
    /// WorkloadRef provides a reference to the Workload object that this Pod belongs to. This field is used by the scheduler to identify the PodGroup and apply the correct group scheduling policies. The Workload object referenced by this field may not exist at the time the Pod is created. This field is immutable, but a Workload object with the same name may be recreated with different policies. Doing this during pod scheduling may result in the placement not conforming to the expected policies.
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

/// PodStatus represents information about the status of a pod. Status may trail the actual state of a system, especially if the node that hosts the pod cannot contact the control plane.
pub const PodStatus = struct {
    /// AllocatedResources is the total requests allocated for this pod by the node. If pod-level requests are not set, this will be the total requests aggregated across containers in the pod.
    allocatedResources: ?std.json.Value = null,
    /// Current service state of pod. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-conditions
    conditions: ?[]const root.io.k8s.api.core.v1.PodCondition = null,
    /// Statuses of containers in this pod. Each container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
    containerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    /// Statuses for any ephemeral containers that have run in this pod. Each ephemeral container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-and-container-status
    ephemeralContainerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    /// Status of extended resource claim backed by DRA.
    extendedResourceClaimStatus: ?root.io.k8s.api.core.v1.PodExtendedResourceClaimStatus = null,
    /// hostIP holds the IP address of the host to which the pod is assigned. Empty if the pod has not started yet. A pod can be assigned to a node that has a problem in kubelet which in turns mean that HostIP will not be updated even if there is a node is assigned to pod
    hostIP: ?[]const u8 = null,
    /// hostIPs holds the IP addresses allocated to the host. If this field is specified, the first entry must match the hostIP field. This list is empty if the pod has not started yet. A pod can be assigned to a node that has a problem in kubelet which in turns means that HostIPs will not be updated even if there is a node is assigned to this pod.
    hostIPs: ?[]const root.io.k8s.api.core.v1.HostIP = null,
    /// Statuses of init containers in this pod. The most recent successful non-restartable init container will have ready = true, the most recently started container will have startTime set. Each init container in the pod should have at most one status in this list, and all statuses should be for containers in the pod. However this is not enforced. If a status for a non-existent container is present in the list, or the list has duplicate names, the behavior of various Kubernetes components is not defined and those statuses might be ignored. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-and-container-status
    initContainerStatuses: ?[]const root.io.k8s.api.core.v1.ContainerStatus = null,
    /// A human readable message indicating details about why the pod is in this condition.
    message: ?[]const u8 = null,
    /// nominatedNodeName is set only when this pod preempts other pods on the node, but it cannot be scheduled right away as preemption victims receive their graceful termination periods. This field does not guarantee that the pod will be scheduled on this node. Scheduler may decide to place the pod elsewhere if other nodes become available sooner. Scheduler may also decide to give the resources on this node to a higher priority pod that is created after preemption. As a result, this field may be different than PodSpec.nodeName when the pod is scheduled.
    nominatedNodeName: ?[]const u8 = null,
    /// If set, this represents the .metadata.generation that the pod status was set based upon. The PodObservedGenerationTracking feature gate must be enabled to use this field.
    observedGeneration: ?i64 = null,
    /// The phase of a Pod is a simple, high-level summary of where the Pod is in its lifecycle. The conditions array, the reason and message fields, and the individual container status arrays contain more detail about the pod's status. There are five possible phase values:
    /// 
    /// Pending: The pod has been accepted by the Kubernetes system, but one or more of the container images has not been created. This includes time before being scheduled as well as time spent downloading images over the network, which could take a while. Running: The pod has been bound to a node, and all of the containers have been created. At least one container is still running, or is in the process of starting or restarting. Succeeded: All containers in the pod have terminated in success, and will not be restarted. Failed: All containers in the pod have terminated, and at least one container has terminated in failure. The container either exited with non-zero status or was terminated by the system. Unknown: For some reason the state of the pod could not be obtained, typically due to an error in communicating with the host of the pod.
    /// 
    /// More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#pod-phase
    phase: ?[]const u8 = null,
    /// podIP address allocated to the pod. Routable at least within the cluster. Empty if not yet allocated.
    podIP: ?[]const u8 = null,
    /// podIPs holds the IP addresses allocated to the pod. If this field is specified, the 0th entry must match the podIP field. Pods may be allocated at most 1 value for each of IPv4 and IPv6. This list is empty if no IPs have been allocated yet.
    podIPs: ?[]const root.io.k8s.api.core.v1.PodIP = null,
    /// The Quality of Service (QOS) classification assigned to the pod based on resource requirements See PodQOSClass type for available QOS classes More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-qos/#quality-of-service-classes
    qosClass: ?[]const u8 = null,
    /// A brief CamelCase message indicating details about why the pod is in this state. e.g. 'Evicted'
    reason: ?[]const u8 = null,
    /// Status of resources resize desired for pod's containers. It is empty if no resources resize is pending. Any changes to container resources will automatically set this to "Proposed" Deprecated: Resize status is moved to two pod conditions PodResizePending and PodResizeInProgress. PodResizePending will track states where the spec has been resized, but the Kubelet has not yet allocated the resources. PodResizeInProgress will track in-progress resizes, and should be present whenever allocated resources != acknowledged resources.
    resize: ?[]const u8 = null,
    /// Status of resource claims.
    resourceClaimStatuses: ?[]const root.io.k8s.api.core.v1.PodResourceClaimStatus = null,
    /// Resources represents the compute resource requests and limits that have been applied at the pod level if pod-level requests or limits are set in PodSpec.Resources
    resources: ?root.io.k8s.api.core.v1.ResourceRequirements = null,
    /// RFC 3339 date and time at which the object was acknowledged by the Kubelet. This is before the Kubelet pulled the container image(s) for the pod.
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

/// PodTemplate describes a template for creating copies of a predefined pod.
pub const PodTemplate = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Template defines the pods that will be created from this pod template. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.template) |v| try v.validate();
    }
};

/// PodTemplateList is a list of PodTemplates.
pub const PodTemplateList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of pod templates
    items: []const root.io.k8s.api.core.v1.PodTemplate,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// PodTemplateSpec describes the data a pod should have when created from a template
pub const PodTemplateSpec = struct {
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Specification of the desired behavior of the pod. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.PodSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
    }
};

/// PortStatus represents the error condition of a service port
pub const PortStatus = struct {
    /// Error is to record the problem with the service port The format of the error shall comply with the following rules: - built-in error values shall be specified in this file and those shall use
    ///   CamelCase names
    /// - cloud provider specific error values must have names that comply with the
    ///   format foo.example.com/CamelCase.
    @"error": ?[]const u8 = null,
    /// Port is the port number of the service port of which status is recorded here
    port: i64,
    /// Protocol is the protocol of the service port of which status is recorded here The supported values are: "TCP", "UDP", "SCTP"
    protocol: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// PortworxVolumeSource represents a Portworx volume resource.
pub const PortworxVolumeSource = struct {
    /// fSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// volumeID uniquely identifies a Portworx volume
    volumeID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op).
pub const PreferredSchedulingTerm = struct {
    /// A node selector term, associated with the corresponding weight.
    preference: root.io.k8s.api.core.v1.NodeSelectorTerm,
    /// Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100.
    weight: i64,

    pub fn validate(self: @This()) !void {
        try self.preference.validate();
    }
};

/// Probe describes a health check to be performed against a container to determine whether it is alive or ready to receive traffic.
pub const Probe = struct {
    /// Exec specifies a command to execute in the container.
    exec: ?root.io.k8s.api.core.v1.ExecAction = null,
    /// Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.
    failureThreshold: ?i64 = null,
    /// GRPC specifies a GRPC HealthCheckRequest.
    grpc: ?root.io.k8s.api.core.v1.GRPCAction = null,
    /// HTTPGet specifies an HTTP GET request to perform.
    httpGet: ?root.io.k8s.api.core.v1.HTTPGetAction = null,
    /// Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
    initialDelaySeconds: ?i64 = null,
    /// How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.
    periodSeconds: ?i64 = null,
    /// Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.
    successThreshold: ?i64 = null,
    /// TCPSocket specifies a connection to a TCP port.
    tcpSocket: ?root.io.k8s.api.core.v1.TCPSocketAction = null,
    /// Optional duration in seconds the pod needs to terminate gracefully upon probe failure. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. If this value is nil, the pod's terminationGracePeriodSeconds will be used. Otherwise, this value overrides the value provided by the pod spec. Value must be non-negative integer. The value zero indicates stop immediately via the kill signal (no opportunity to shut down). This is a beta field and requires enabling ProbeTerminationGracePeriod feature gate. Minimum value is 1. spec.terminationGracePeriodSeconds is used if unset.
    terminationGracePeriodSeconds: ?i64 = null,
    /// Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes
    timeoutSeconds: ?i64 = null,

    pub fn validate(self: @This()) !void {
        if (self.exec) |v| try v.validate();
        if (self.grpc) |v| try v.validate();
        if (self.httpGet) |v| try v.validate();
        if (self.tcpSocket) |v| try v.validate();
    }
};

/// Represents a projected volume source
pub const ProjectedVolumeSource = struct {
    /// defaultMode are the mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    defaultMode: ?i64 = null,
    /// sources is the list of volume projections. Each entry in this list handles one source.
    sources: ?[]const root.io.k8s.api.core.v1.VolumeProjection = null,

    pub fn validate(self: @This()) !void {
        if (self.sources) |arr| for (arr) |item| try item.validate();
    }
};

/// Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte volumes do not support ownership management or SELinux relabeling.
pub const QuobyteVolumeSource = struct {
    /// group to map volume access to Default is no group
    group: ?[]const u8 = null,
    /// readOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
    readOnly: ?bool = null,
    /// registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
    registry: []const u8,
    /// tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin
    tenant: ?[]const u8 = null,
    /// user to map volume access to Defaults to serivceaccount user
    user: ?[]const u8 = null,
    /// volume is a string that references an already created Quobyte volume by name.
    volume: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
pub const RBDPersistentVolumeSource = struct {
    /// fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
    fsType: ?[]const u8 = null,
    /// image is the rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    image: []const u8,
    /// keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    keyring: ?[]const u8 = null,
    /// monitors is a collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    monitors: []const []const u8,
    /// pool is the rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    pool: ?[]const u8 = null,
    /// readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    readOnly: ?bool = null,
    /// secretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    secretRef: ?root.io.k8s.api.core.v1.SecretReference = null,
    /// user is the rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a Rados Block Device mount that lasts the lifetime of a pod. RBD volumes support ownership management and SELinux relabeling.
pub const RBDVolumeSource = struct {
    /// fsType is the filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
    fsType: ?[]const u8 = null,
    /// image is the rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    image: []const u8,
    /// keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    keyring: ?[]const u8 = null,
    /// monitors is a collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    monitors: []const []const u8,
    /// pool is the rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    pool: ?[]const u8 = null,
    /// readOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    readOnly: ?bool = null,
    /// secretRef is name of the authentication secret for RBDUser. If provided overrides keyring. Default is nil. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// user is the rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// ReplicationController represents the configuration of a replication controller.
pub const ReplicationController = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// If the Labels of a ReplicationController are empty, they are defaulted to be the same as the Pod(s) that the replication controller manages. Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the specification of the desired behavior of the replication controller. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.ReplicationControllerSpec = null,
    /// Status is the most recently observed status of the replication controller. This data may be out of date by some window of time. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.ReplicationControllerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// ReplicationControllerCondition describes the state of a replication controller at a certain point.
pub const ReplicationControllerCondition = struct {
    /// The last time the condition transitioned from one status to another.
    lastTransitionTime: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// A human readable message indicating details about the transition.
    message: ?[]const u8 = null,
    /// The reason for the condition's last transition.
    reason: ?[]const u8 = null,
    /// Status of the condition, one of True, False, Unknown.
    status: []const u8,
    /// Type of replication controller condition.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ReplicationControllerList is a collection of replication controllers.
pub const ReplicationControllerList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of replication controllers. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller
    items: []const root.io.k8s.api.core.v1.ReplicationController,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ReplicationControllerSpec is the specification of a replication controller.
pub const ReplicationControllerSpec = struct {
    /// Minimum number of seconds for which a newly created pod should be ready without any of its container crashing, for it to be considered available. Defaults to 0 (pod will be considered available as soon as it is ready)
    minReadySeconds: ?i64 = null,
    /// Replicas is the number of desired replicas. This is a pointer to distinguish between explicit zero and unspecified. Defaults to 1. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
    replicas: ?i64 = null,
    /// Selector is a label query over pods that should match the Replicas count. If Selector is empty, it is defaulted to the labels present on the Pod template. Label keys and values that must match in order to be controlled by this replication controller, if empty defaulted to labels on Pod template. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors
    selector: ?std.json.Value = null,
    /// Template is the object that describes the pod that will be created if insufficient replicas are detected. This takes precedence over a TemplateRef. The only allowed template.spec.restartPolicy value is "Always". More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#pod-template
    template: ?root.io.k8s.api.core.v1.PodTemplateSpec = null,

    pub fn validate(self: @This()) !void {
        if (self.template) |v| try v.validate();
    }
};

/// ReplicationControllerStatus represents the current status of a replication controller.
pub const ReplicationControllerStatus = struct {
    /// The number of available replicas (ready for at least minReadySeconds) for this replication controller.
    availableReplicas: ?i64 = null,
    /// Represents the latest available observations of a replication controller's current state.
    conditions: ?[]const root.io.k8s.api.core.v1.ReplicationControllerCondition = null,
    /// The number of pods that have labels matching the labels of the pod template of the replication controller.
    fullyLabeledReplicas: ?i64 = null,
    /// ObservedGeneration reflects the generation of the most recently observed replication controller.
    observedGeneration: ?i64 = null,
    /// The number of ready replicas for this replication controller.
    readyReplicas: ?i64 = null,
    /// Replicas is the most recently observed number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller#what-is-a-replicationcontroller
    replicas: i64,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

/// ResourceClaim references one entry in PodSpec.ResourceClaims.
pub const ResourceClaim = struct {
    /// Name must match the name of one entry in pod.spec.resourceClaims of the Pod where this field is used. It makes that resource available inside a container.
    name: []const u8,
    /// Request is the name chosen for a request in the referenced claim. If empty, everything from the claim is made available, otherwise only the result of this request.
    request: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceFieldSelector represents container resources (cpu, memory) and their output format
pub const ResourceFieldSelector = struct {
    /// Container name: required for volumes, optional for env vars
    containerName: ?[]const u8 = null,
    /// Specifies the output format of the exposed resources, defaults to "1"
    divisor: ?root.io.k8s.apimachinery.pkg.api.resource.Quantity = null,
    /// Required: resource to select
    resource: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceHealth represents the health of a resource. It has the latest device health information. This is a part of KEP https://kep.k8s.io/4680.
pub const ResourceHealth = struct {
    /// Health of the resource. can be one of:
    ///  - Healthy: operates as normal
    ///  - Unhealthy: reported unhealthy. We consider this a temporary health issue
    ///               since we do not have a mechanism today to distinguish
    ///               temporary and permanent issues.
    ///  - Unknown: The status cannot be determined.
    ///             For example, Device Plugin got unregistered and hasn't been re-registered since.
    /// 
    /// In future we may want to introduce the PermanentlyUnhealthy Status.
    health: ?[]const u8 = null,
    /// ResourceID is the unique identifier of the resource. See the ResourceID type for more information.
    resourceID: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceQuota sets aggregate quota restrictions enforced per namespace
pub const ResourceQuota = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the desired quota. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.ResourceQuotaSpec = null,
    /// Status defines the actual enforced quota and its current usage. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.ResourceQuotaStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// ResourceQuotaList is a list of ResourceQuota items.
pub const ResourceQuotaList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is a list of ResourceQuota objects. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
    items: []const root.io.k8s.api.core.v1.ResourceQuota,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ResourceQuotaSpec defines the desired hard limits to enforce for Quota.
pub const ResourceQuotaSpec = struct {
    /// hard is the set of desired hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
    hard: ?std.json.Value = null,
    /// scopeSelector is also a collection of filters like scopes that must match each object tracked by a quota but expressed using ScopeSelectorOperator in combination with possible values. For a resource to match, both scopes AND scopeSelector (if specified in spec), must be matched.
    scopeSelector: ?root.io.k8s.api.core.v1.ScopeSelector = null,
    /// A collection of filters that must match each object tracked by a quota. If not specified, the quota matches all objects.
    scopes: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.scopeSelector) |v| try v.validate();
    }
};

/// ResourceQuotaStatus defines the enforced hard limits and observed use.
pub const ResourceQuotaStatus = struct {
    /// Hard is the set of enforced hard limits for each named resource. More info: https://kubernetes.io/docs/concepts/policy/resource-quotas/
    hard: ?std.json.Value = null,
    /// Used is the current observed total usage of the resource in the namespace.
    used: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ResourceRequirements describes the compute resource requirements.
pub const ResourceRequirements = struct {
    /// Claims lists the names of resources, defined in spec.resourceClaims, that are used by this container.
    /// 
    /// This field depends on the DynamicResourceAllocation feature gate.
    /// 
    /// This field is immutable. It can only be set for containers.
    claims: ?[]const root.io.k8s.api.core.v1.ResourceClaim = null,
    /// Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    limits: ?std.json.Value = null,
    /// Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. Requests cannot exceed Limits. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    requests: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        if (self.claims) |arr| for (arr) |item| try item.validate();
    }
};

/// ResourceStatus represents the status of a single resource allocated to a Pod.
pub const ResourceStatus = struct {
    /// Name of the resource. Must be unique within the pod and in case of non-DRA resource, match one of the resources from the pod spec. For DRA resources, the value must be "claim:<claim_name>/<request>". When this status is reported about a container, the "claim_name" and "request" must match one of the claims of this container.
    name: []const u8,
    /// List of unique resources health. Each element in the list contains an unique resource ID and its health. At a minimum, for the lifetime of a Pod, resource ID must uniquely identify the resource allocated to the Pod on the Node. If other Pod on the same Node reports the status with the same resource ID, it must be the same resource they share. See ResourceID type definition for a specific format it has in various use cases.
    resources: ?[]const root.io.k8s.api.core.v1.ResourceHealth = null,

    pub fn validate(self: @This()) !void {
        if (self.resources) |arr| for (arr) |item| try item.validate();
    }
};

/// SELinuxOptions are the labels to be applied to the container
pub const SELinuxOptions = struct {
    /// Level is SELinux level label that applies to the container.
    level: ?[]const u8 = null,
    /// Role is a SELinux role label that applies to the container.
    role: ?[]const u8 = null,
    /// Type is a SELinux type label that applies to the container.
    @"type": ?[]const u8 = null,
    /// User is a SELinux user label that applies to the container.
    user: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume
pub const ScaleIOPersistentVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs"
    fsType: ?[]const u8 = null,
    /// gateway is the host address of the ScaleIO API Gateway.
    gateway: []const u8,
    /// protectionDomain is the name of the ScaleIO Protection Domain for the configured storage.
    protectionDomain: ?[]const u8 = null,
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
    secretRef: root.io.k8s.api.core.v1.SecretReference,
    /// sslEnabled is the flag to enable/disable SSL communication with Gateway, default false
    sslEnabled: ?bool = null,
    /// storageMode indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
    storageMode: ?[]const u8 = null,
    /// storagePool is the ScaleIO Storage Pool associated with the protection domain.
    storagePool: ?[]const u8 = null,
    /// system is the name of the storage system as configured in ScaleIO.
    system: []const u8,
    /// volumeName is the name of a volume already created in the ScaleIO system that is associated with this volume source.
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.secretRef.validate();
    }
};

/// ScaleIOVolumeSource represents a persistent ScaleIO volume
pub const ScaleIOVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs".
    fsType: ?[]const u8 = null,
    /// gateway is the host address of the ScaleIO API Gateway.
    gateway: []const u8,
    /// protectionDomain is the name of the ScaleIO Protection Domain for the configured storage.
    protectionDomain: ?[]const u8 = null,
    /// readOnly Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef references to the secret for ScaleIO user and other sensitive information. If this is not provided, Login operation will fail.
    secretRef: root.io.k8s.api.core.v1.LocalObjectReference,
    /// sslEnabled Flag enable/disable SSL communication with Gateway, default false
    sslEnabled: ?bool = null,
    /// storageMode indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
    storageMode: ?[]const u8 = null,
    /// storagePool is the ScaleIO Storage Pool associated with the protection domain.
    storagePool: ?[]const u8 = null,
    /// system is the name of the storage system as configured in ScaleIO.
    system: []const u8,
    /// volumeName is the name of a volume already created in the ScaleIO system that is associated with this volume source.
    volumeName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        try self.secretRef.validate();
    }
};

/// A scope selector represents the AND of the selectors represented by the scoped-resource selector requirements.
pub const ScopeSelector = struct {
    /// A list of scope selector requirements by scope of the resources.
    matchExpressions: ?[]const root.io.k8s.api.core.v1.ScopedResourceSelectorRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchExpressions) |arr| for (arr) |item| try item.validate();
    }
};

/// A scoped-resource selector requirement is a selector that contains values, a scope name, and an operator that relates the scope name and values.
pub const ScopedResourceSelectorRequirement = struct {
    /// Represents a scope's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist.
    operator: []const u8,
    /// The name of the scope that the selector applies to.
    scopeName: []const u8,
    /// An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.
    values: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SeccompProfile defines a pod/container's seccomp profile settings. Only one profile source may be set.
pub const SeccompProfile = struct {
    /// localhostProfile indicates a profile defined in a file on the node should be used. The profile must be preconfigured on the node to work. Must be a descending path, relative to the kubelet's configured seccomp profile location. Must be set if type is "Localhost". Must NOT be set for any other type.
    localhostProfile: ?[]const u8 = null,
    /// type indicates which kind of seccomp profile will be applied. Valid options are:
    /// 
    /// Localhost - a profile defined in a file on the node should be used. RuntimeDefault - the container runtime default profile should be used. Unconfined - no profile should be applied.
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Secret holds secret data of a certain type. The total bytes of the values in the Data field must be less than MaxSecretSize bytes.
pub const Secret = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Data contains the secret data. Each key must consist of alphanumeric characters, '-', '_' or '.'. The serialized form of the secret data is a base64 encoded string, representing the arbitrary (possibly non-string) data value here. Described in https://tools.ietf.org/html/rfc4648#section-4
    data: ?std.json.Value = null,
    /// Immutable, if set to true, ensures that data stored in the Secret cannot be updated (only object metadata can be modified). If not set to true, the field can be modified at any time. Defaulted to nil.
    immutable: ?bool = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// stringData allows specifying non-binary secret data in string form. It is provided as a write-only input field for convenience. All keys and values are merged into the data field on write, overwriting any existing values. The stringData field is never output when reading from the API.
    stringData: ?std.json.Value = null,
    /// Used to facilitate programmatic handling of secret data. More info: https://kubernetes.io/docs/concepts/configuration/secret/#secret-types
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
    }
};

/// SecretEnvSource selects a Secret to populate the environment variables with.
/// 
/// The contents of the target Secret's Data field will represent the key-value pairs as environment variables.
pub const SecretEnvSource = struct {
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// Specify whether the Secret must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SecretKeySelector selects a key of a Secret.
pub const SecretKeySelector = struct {
    /// The key of the secret to select from.  Must be a valid secret key.
    key: []const u8,
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// Specify whether the Secret or its key must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// SecretList is a list of Secret.
pub const SecretList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Items is a list of secret objects. More info: https://kubernetes.io/docs/concepts/configuration/secret
    items: []const root.io.k8s.api.core.v1.Secret,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// Adapts a secret into a projected volume.
/// 
/// The contents of the target Secret's Data field will be presented in a projected volume as files using the keys in the Data field as the file names. Note that this is identical to a secret volume source without the default mode.
pub const SecretProjection = struct {
    /// items if unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    /// Name of the referent. This field is effectively required, but due to backwards compatibility is allowed to be empty. Instances of this type with an empty value here are almost certainly wrong. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: ?[]const u8 = null,
    /// optional field specify whether the Secret or its key must be defined
    optional: ?bool = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// SecretReference represents a Secret Reference. It has enough information to retrieve secret in any namespace
pub const SecretReference = struct {
    /// name is unique within a namespace to reference a secret resource.
    name: ?[]const u8 = null,
    /// namespace defines the space within which the secret name must be unique.
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Adapts a Secret into a volume.
/// 
/// The contents of the target Secret's Data field will be presented in a volume as files using the keys in the Data field as the file names. Secret volumes support ownership management and SELinux relabeling.
pub const SecretVolumeSource = struct {
    /// defaultMode is Optional: mode bits used to set permissions on created files by default. Must be an octal value between 0000 and 0777 or a decimal value between 0 and 511. YAML accepts both octal and decimal values, JSON requires decimal values for mode bits. Defaults to 0644. Directories within the path are not affected by this setting. This might be in conflict with other options that affect the file mode, like fsGroup, and the result can be other mode bits set.
    defaultMode: ?i64 = null,
    /// items If unspecified, each key-value pair in the Data field of the referenced Secret will be projected into the volume as a file whose name is the key and content is the value. If specified, the listed keys will be projected into the specified paths, and unlisted keys will not be present. If a key is specified which is not present in the Secret, the volume setup will error unless it is marked optional. Paths must be relative and may not contain the '..' path or start with '..'.
    items: ?[]const root.io.k8s.api.core.v1.KeyToPath = null,
    /// optional field specify whether the Secret or its keys must be defined
    optional: ?bool = null,
    /// secretName is the name of the secret in the pod's namespace to use. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret
    secretName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.items) |arr| for (arr) |item| try item.validate();
    }
};

/// SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence.
pub const SecurityContext = struct {
    /// AllowPrivilegeEscalation controls whether a process can gain more privileges than its parent process. This bool directly controls if the no_new_privs flag will be set on the container process. AllowPrivilegeEscalation is true always when the container is: 1) run as Privileged 2) has CAP_SYS_ADMIN Note that this field cannot be set when spec.os.name is windows.
    allowPrivilegeEscalation: ?bool = null,
    /// appArmorProfile is the AppArmor options to use by this container. If set, this profile overrides the pod's appArmorProfile. Note that this field cannot be set when spec.os.name is windows.
    appArmorProfile: ?root.io.k8s.api.core.v1.AppArmorProfile = null,
    /// The capabilities to add/drop when running containers. Defaults to the default set of capabilities granted by the container runtime. Note that this field cannot be set when spec.os.name is windows.
    capabilities: ?root.io.k8s.api.core.v1.Capabilities = null,
    /// Run container in privileged mode. Processes in privileged containers are essentially equivalent to root on the host. Defaults to false. Note that this field cannot be set when spec.os.name is windows.
    privileged: ?bool = null,
    /// procMount denotes the type of proc mount to use for the containers. The default value is Default which uses the container runtime defaults for readonly paths and masked paths. This requires the ProcMountType feature flag to be enabled. Note that this field cannot be set when spec.os.name is windows.
    procMount: ?[]const u8 = null,
    /// Whether this container has a read-only root filesystem. Default is false. Note that this field cannot be set when spec.os.name is windows.
    readOnlyRootFilesystem: ?bool = null,
    /// The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is windows.
    runAsGroup: ?i64 = null,
    /// Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
    runAsNonRoot: ?bool = null,
    /// The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is windows.
    runAsUser: ?i64 = null,
    /// The SELinux context to be applied to the container. If unspecified, the container runtime will allocate a random SELinux context for each container.  May also be set in PodSecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is windows.
    seLinuxOptions: ?root.io.k8s.api.core.v1.SELinuxOptions = null,
    /// The seccomp options to use by this container. If seccomp options are provided at both the pod & container level, the container options override the pod options. Note that this field cannot be set when spec.os.name is windows.
    seccompProfile: ?root.io.k8s.api.core.v1.SeccompProfile = null,
    /// The Windows specific settings applied to all containers. If unspecified, the options from the PodSecurityContext will be used. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. Note that this field cannot be set when spec.os.name is linux.
    windowsOptions: ?root.io.k8s.api.core.v1.WindowsSecurityContextOptions = null,

    pub fn validate(self: @This()) !void {
        if (self.appArmorProfile) |v| try v.validate();
        if (self.capabilities) |v| try v.validate();
        if (self.seLinuxOptions) |v| try v.validate();
        if (self.seccompProfile) |v| try v.validate();
        if (self.windowsOptions) |v| try v.validate();
    }
};

/// Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.
pub const Service = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Spec defines the behavior of a service. https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    spec: ?root.io.k8s.api.core.v1.ServiceSpec = null,
    /// Most recently observed status of the service. Populated by the system. Read-only. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#spec-and-status
    status: ?root.io.k8s.api.core.v1.ServiceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        if (self.spec) |v| try v.validate();
        if (self.status) |v| try v.validate();
    }
};

/// ServiceAccount binds together: * a name, understood by users, and perhaps by peripheral systems, for an identity * a principal that can be authenticated and authorized * a set of secrets
pub const ServiceAccount = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted. Can be overridden at the pod level.
    automountServiceAccountToken: ?bool = null,
    /// ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount. ImagePullSecrets are distinct from Secrets because Secrets can be mounted in the pod, but ImagePullSecrets are only accessed by the kubelet. More info: https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod
    imagePullSecrets: ?[]const root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard object's metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    /// Secrets is a list of the secrets in the same namespace that pods running using this ServiceAccount are allowed to use. Pods are only limited to this list if this service account has a "kubernetes.io/enforce-mountable-secrets" annotation set to "true". The "kubernetes.io/enforce-mountable-secrets" annotation is deprecated since v1.32. Prefer separate namespaces to isolate access to mounted secrets. This field should not be used to find auto-generated service account token secrets for use outside of pods. Instead, tokens can be requested directly using the TokenRequest API, or service account token secrets can be manually created. More info: https://kubernetes.io/docs/concepts/configuration/secret
    secrets: ?[]const root.io.k8s.api.core.v1.ObjectReference = null,

    pub fn validate(self: @This()) !void {
        if (self.imagePullSecrets) |arr| for (arr) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
        if (self.secrets) |arr| for (arr) |item| try item.validate();
    }
};

/// ServiceAccountList is a list of ServiceAccount objects
pub const ServiceAccountList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of ServiceAccounts. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
    items: []const root.io.k8s.api.core.v1.ServiceAccount,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ServiceAccountTokenProjection represents a projected service account token volume. This projection can be used to insert a service account token into the pods runtime filesystem for use against APIs (Kubernetes API Server or otherwise).
pub const ServiceAccountTokenProjection = struct {
    /// audience is the intended audience of the token. A recipient of a token must identify itself with an identifier specified in the audience of the token, and otherwise should reject the token. The audience defaults to the identifier of the apiserver.
    audience: ?[]const u8 = null,
    /// expirationSeconds is the requested duration of validity of the service account token. As the token approaches expiration, the kubelet volume plugin will proactively rotate the service account token. The kubelet will start trying to rotate the token if the token is older than 80 percent of its time to live or if the token is older than 24 hours.Defaults to 1 hour and must be at least 10 minutes.
    expirationSeconds: ?i64 = null,
    /// path is the path relative to the mount point of the file to project the token into.
    path: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ServiceList holds a list of services.
pub const ServiceList = struct {
    /// APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources
    apiVersion: ?[]const u8 = null,
    /// List of services
    items: []const root.io.k8s.api.core.v1.Service,
    /// Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    kind: ?[]const u8 = null,
    /// Standard list metadata. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

/// ServicePort contains information on service's port.
pub const ServicePort = struct {
    /// The application protocol for this port. This is used as a hint for implementations to offer richer behavior for protocols that they understand. This field follows standard Kubernetes label syntax. Valid values are either:
    /// 
    /// * Un-prefixed protocol names - reserved for IANA standard service names (as per RFC-6335 and https://www.iana.org/assignments/service-names).
    /// 
    /// * Kubernetes-defined prefixed names:
    ///   * 'kubernetes.io/h2c' - HTTP/2 prior knowledge over cleartext as described in https://www.rfc-editor.org/rfc/rfc9113.html#name-starting-http-2-with-prior-
    ///   * 'kubernetes.io/ws'  - WebSocket over cleartext as described in https://www.rfc-editor.org/rfc/rfc6455
    ///   * 'kubernetes.io/wss' - WebSocket over TLS as described in https://www.rfc-editor.org/rfc/rfc6455
    /// 
    /// * Other protocols should use implementation-defined prefixed names such as mycompany.com/my-custom-protocol.
    appProtocol: ?[]const u8 = null,
    /// The name of this port within the service. This must be a DNS_LABEL. All ports within a ServiceSpec must have unique names. When considering the endpoints for a Service, this must match the 'name' field in the EndpointPort. Optional if only one ServicePort is defined on this service.
    name: ?[]const u8 = null,
    /// The port on each node on which this service is exposed when type is NodePort or LoadBalancer.  Usually assigned by the system. If a value is specified, in-range, and not in use it will be used, otherwise the operation will fail.  If not specified, a port will be allocated if this Service requires one.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type from NodePort to ClusterIP). More info: https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport
    nodePort: ?i64 = null,
    /// The port that will be exposed by this service.
    port: i64,
    /// The IP protocol for this port. Supports "TCP", "UDP", and "SCTP". Default is TCP.
    protocol: ?[]const u8 = null,
    /// Number or name of the port to access on the pods targeted by the service. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME. If this is a string, it will be looked up as a named port in the target Pod's container ports. If this is not specified, the value of the 'port' field is used (an identity map). This field is ignored for services with clusterIP=None, and should be omitted or set equal to the 'port' field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#defining-a-service
    targetPort: ?root.io.k8s.apimachinery.pkg.util.intstr.IntOrString = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// ServiceSpec describes the attributes that a user creates on a service.
pub const ServiceSpec = struct {
    /// allocateLoadBalancerNodePorts defines if NodePorts will be automatically allocated for services with type LoadBalancer.  Default is "true". It may be set to "false" if the cluster load-balancer does not rely on NodePorts.  If the caller requests specific NodePorts (by specifying a value), those requests will be respected, regardless of this field. This field may only be set for services with type LoadBalancer and will be cleared if the type is changed to any other type.
    allocateLoadBalancerNodePorts: ?bool = null,
    /// clusterIP is the IP address of the service and is usually assigned randomly. If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be blank) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address. Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    clusterIP: ?[]const u8 = null,
    /// ClusterIPs is a list of IP addresses assigned to this service, and are usually assigned randomly.  If an address is specified manually, is in-range (as per system configuration), and is not in use, it will be allocated to the service; otherwise creation of the service will fail. This field may not be changed through updates unless the type field is also being changed to ExternalName (which requires this field to be empty) or the type field is being changed from ExternalName (in which case this field may optionally be specified, as describe above).  Valid values are "None", empty string (""), or a valid IP address.  Setting this to "None" makes a "headless service" (no virtual IP), which is useful when direct endpoint connections are preferred and proxying is not required.  Only applies to types ClusterIP, NodePort, and LoadBalancer. If this field is specified when creating a Service of type ExternalName, creation will fail. This field will be wiped when updating a Service to type ExternalName.  If this field is not specified, it will be initialized from the clusterIP field.  If this field is specified, clients must ensure that clusterIPs[0] and clusterIP have the same value.
    /// 
    /// This field may hold a maximum of two entries (dual-stack IPs, in either order). These IPs must correspond to the values of the ipFamilies field. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    clusterIPs: ?[]const []const u8 = null,
    /// externalIPs is a list of IP addresses for which nodes in the cluster will also accept traffic for this service.  These IPs are not managed by Kubernetes.  The user is responsible for ensuring that traffic arrives at a node with this IP.  A common example is external load-balancers that are not part of the Kubernetes system.
    externalIPs: ?[]const []const u8 = null,
    /// externalName is the external reference that discovery mechanisms will return as an alias for this service (e.g. a DNS CNAME record). No proxying will be involved.  Must be a lowercase RFC-1123 hostname (https://tools.ietf.org/html/rfc1123) and requires `type` to be "ExternalName".
    externalName: ?[]const u8 = null,
    /// externalTrafficPolicy describes how nodes distribute service traffic they receive on one of the Service's "externally-facing" addresses (NodePorts, ExternalIPs, and LoadBalancer IPs). If set to "Local", the proxy will configure the service in a way that assumes that external load balancers will take care of balancing the service traffic between nodes, and so each node will deliver traffic only to the node-local endpoints of the service, without masquerading the client source IP. (Traffic mistakenly sent to a node with no endpoints will be dropped.) The default value, "Cluster", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features). Note that traffic sent to an External IP or LoadBalancer IP from within the cluster will always get "Cluster" semantics, but clients sending to a NodePort from within the cluster may need to take traffic policy into account when picking a node.
    externalTrafficPolicy: ?[]const u8 = null,
    /// healthCheckNodePort specifies the healthcheck nodePort for the service. This only applies when type is set to LoadBalancer and externalTrafficPolicy is set to Local. If a value is specified, is in-range, and is not in use, it will be used.  If not specified, a value will be automatically allocated.  External systems (e.g. load-balancers) can use this port to determine if a given node holds endpoints for this service or not.  If this field is specified when creating a Service which does not need it, creation will fail. This field will be wiped when updating a Service to no longer need it (e.g. changing type). This field cannot be updated once set.
    healthCheckNodePort: ?i64 = null,
    /// InternalTrafficPolicy describes how nodes distribute service traffic they receive on the ClusterIP. If set to "Local", the proxy will assume that pods only want to talk to endpoints of the service on the same node as the pod, dropping the traffic if there are no local endpoints. The default value, "Cluster", uses the standard behavior of routing to all endpoints evenly (possibly modified by topology and other features).
    internalTrafficPolicy: ?[]const u8 = null,
    /// IPFamilies is a list of IP families (e.g. IPv4, IPv6) assigned to this service. This field is usually assigned automatically based on cluster configuration and the ipFamilyPolicy field. If this field is specified manually, the requested family is available in the cluster, and ipFamilyPolicy allows it, it will be used; otherwise creation of the service will fail. This field is conditionally mutable: it allows for adding or removing a secondary IP family, but it does not allow changing the primary IP family of the Service. Valid values are "IPv4" and "IPv6".  This field only applies to Services of types ClusterIP, NodePort, and LoadBalancer, and does apply to "headless" services. This field will be wiped when updating a Service to type ExternalName.
    /// 
    /// This field may hold a maximum of two entries (dual-stack families, in either order).  These families must correspond to the values of the clusterIPs field, if specified. Both clusterIPs and ipFamilies are governed by the ipFamilyPolicy field.
    ipFamilies: ?[]const []const u8 = null,
    /// IPFamilyPolicy represents the dual-stack-ness requested or required by this Service. If there is no value provided, then this field will be set to SingleStack. Services can be "SingleStack" (a single IP family), "PreferDualStack" (two IP families on dual-stack configured clusters or a single IP family on single-stack clusters), or "RequireDualStack" (two IP families on dual-stack configured clusters, otherwise fail). The ipFamilies and clusterIPs fields depend on the value of this field. This field will be wiped when updating a service to type ExternalName.
    ipFamilyPolicy: ?[]const u8 = null,
    /// loadBalancerClass is the class of the load balancer implementation this Service belongs to. If specified, the value of this field must be a label-style identifier, with an optional prefix, e.g. "internal-vip" or "example.com/internal-vip". Unprefixed names are reserved for end-users. This field can only be set when the Service type is 'LoadBalancer'. If not set, the default load balancer implementation is used, today this is typically done through the cloud provider integration, but should apply for any default implementation. If set, it is assumed that a load balancer implementation is watching for Services with a matching class. Any default load balancer implementation (e.g. cloud providers) should ignore Services that set this field. This field can only be set when creating or updating a Service to type 'LoadBalancer'. Once set, it can not be changed. This field will be wiped when a service is updated to a non 'LoadBalancer' type.
    loadBalancerClass: ?[]const u8 = null,
    /// Only applies to Service Type: LoadBalancer. This feature depends on whether the underlying cloud-provider supports specifying the loadBalancerIP when a load balancer is created. This field will be ignored if the cloud-provider does not support the feature. Deprecated: This field was under-specified and its meaning varies across implementations. Using it is non-portable and it may not support dual-stack. Users are encouraged to use implementation-specific annotations when available.
    loadBalancerIP: ?[]const u8 = null,
    /// If specified and supported by the platform, this will restrict traffic through the cloud-provider load-balancer will be restricted to the specified client IPs. This field will be ignored if the cloud-provider does not support the feature." More info: https://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/
    loadBalancerSourceRanges: ?[]const []const u8 = null,
    /// The list of ports that are exposed by this service. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    ports: ?[]const root.io.k8s.api.core.v1.ServicePort = null,
    /// publishNotReadyAddresses indicates that any agent which deals with endpoints for this Service should disregard any indications of ready/not-ready. The primary use case for setting this field is for a StatefulSet's Headless Service to propagate SRV DNS records for its Pods for the purpose of peer discovery. The Kubernetes controllers that generate Endpoints and EndpointSlice resources for Services interpret this to mean that all endpoints are considered "ready" even if the Pods themselves are not. Agents which consume only Kubernetes generated endpoints through the Endpoints or EndpointSlice resources can safely assume this behavior.
    publishNotReadyAddresses: ?bool = null,
    /// Route service traffic to pods with label keys and values matching this selector. If empty or not present, the service is assumed to have an external process managing its endpoints, which Kubernetes will not modify. Only applies to types ClusterIP, NodePort, and LoadBalancer. Ignored if type is ExternalName. More info: https://kubernetes.io/docs/concepts/services-networking/service/
    selector: ?std.json.Value = null,
    /// Supports "ClientIP" and "None". Used to maintain session affinity. Enable client IP based session affinity. Must be ClientIP or None. Defaults to None. More info: https://kubernetes.io/docs/concepts/services-networking/service/#virtual-ips-and-service-proxies
    sessionAffinity: ?[]const u8 = null,
    /// sessionAffinityConfig contains the configurations of session affinity.
    sessionAffinityConfig: ?root.io.k8s.api.core.v1.SessionAffinityConfig = null,
    /// TrafficDistribution offers a way to express preferences for how traffic is distributed to Service endpoints. Implementations can use this field as a hint, but are not required to guarantee strict adherence. If the field is not set, the implementation will apply its default routing strategy. If set to "PreferClose", implementations should prioritize endpoints that are in the same zone.
    trafficDistribution: ?[]const u8 = null,
    /// type determines how the Service is exposed. Defaults to ClusterIP. Valid options are ExternalName, ClusterIP, NodePort, and LoadBalancer. "ClusterIP" allocates a cluster-internal IP address for load-balancing to endpoints. Endpoints are determined by the selector or if that is not specified, by manual construction of an Endpoints object or EndpointSlice objects. If clusterIP is "None", no virtual IP is allocated and the endpoints are published as a set of endpoints rather than a virtual IP. "NodePort" builds on ClusterIP and allocates a port on every node which routes to the same endpoints as the clusterIP. "LoadBalancer" builds on NodePort and creates an external load-balancer (if supported in the current cloud) which routes to the same endpoints as the clusterIP. "ExternalName" aliases this service to the specified externalName. Several other fields do not apply to ExternalName services. More info: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types
    @"type": ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.ports) |arr| for (arr) |item| try item.validate();
        if (self.sessionAffinityConfig) |v| try v.validate();
    }
};

/// ServiceStatus represents the current status of a service.
pub const ServiceStatus = struct {
    /// Current service state
    conditions: ?[]const root.io.k8s.apimachinery.pkg.apis.meta.v1.Condition = null,
    /// LoadBalancer contains the current status of the load-balancer, if one is present.
    loadBalancer: ?root.io.k8s.api.core.v1.LoadBalancerStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.conditions) |arr| for (arr) |item| try item.validate();
        if (self.loadBalancer) |v| try v.validate();
    }
};

/// SessionAffinityConfig represents the configurations of session affinity.
pub const SessionAffinityConfig = struct {
    /// clientIP contains the configurations of Client IP based session affinity.
    clientIP: ?root.io.k8s.api.core.v1.ClientIPConfig = null,

    pub fn validate(self: @This()) !void {
        if (self.clientIP) |v| try v.validate();
    }
};

/// SleepAction describes a "sleep" action.
pub const SleepAction = struct {
    /// Seconds is the number of seconds to sleep.
    seconds: i64,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Represents a StorageOS persistent volume resource.
pub const StorageOSPersistentVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
    secretRef: ?root.io.k8s.api.core.v1.ObjectReference = null,
    /// volumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
    volumeName: ?[]const u8 = null,
    /// volumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
    volumeNamespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Represents a StorageOS persistent volume resource.
pub const StorageOSVolumeSource = struct {
    /// fsType is the filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// readOnly defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
    readOnly: ?bool = null,
    /// secretRef specifies the secret to use for obtaining the StorageOS API credentials.  If not specified, default values will be attempted.
    secretRef: ?root.io.k8s.api.core.v1.LocalObjectReference = null,
    /// volumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
    volumeName: ?[]const u8 = null,
    /// volumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
    volumeNamespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.secretRef) |v| try v.validate();
    }
};

/// Sysctl defines a kernel parameter to be set
pub const Sysctl = struct {
    /// Name of a property to set
    name: []const u8,
    /// Value of a property to set
    value: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TCPSocketAction describes an action based on opening a socket
pub const TCPSocketAction = struct {
    /// Optional: Host name to connect to, defaults to the pod IP.
    host: ?[]const u8 = null,
    /// Number or name of the port to access on the container. Number must be in the range 1 to 65535. Name must be an IANA_SVC_NAME.
    port: root.io.k8s.apimachinery.pkg.util.intstr.IntOrString,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// The node this Taint is attached to has the "effect" on any pod that does not tolerate the Taint.
pub const Taint = struct {
    /// Required. The effect of the taint on pods that do not tolerate the taint. Valid effects are NoSchedule, PreferNoSchedule and NoExecute.
    effect: []const u8,
    /// Required. The taint key to be applied to a node.
    key: []const u8,
    /// TimeAdded represents the time at which the taint was added.
    timeAdded: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.Time = null,
    /// The taint value corresponding to the taint key.
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>.
pub const Toleration = struct {
    /// Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute.
    effect: ?[]const u8 = null,
    /// Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys.
    key: ?[]const u8 = null,
    /// Operator represents a key's relationship to the value. Valid operators are Exists, Equal, Lt, and Gt. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category. Lt and Gt perform numeric comparisons (requires feature gate TaintTolerationComparisonOperators).
    operator: ?[]const u8 = null,
    /// TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system.
    tolerationSeconds: ?i64 = null,
    /// Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string.
    value: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A topology selector requirement is a selector that matches given label. This is an alpha feature and may change in the future.
pub const TopologySelectorLabelRequirement = struct {
    /// The label key that the selector applies to.
    key: []const u8,
    /// An array of string values. One value must match the label to be selected. Each entry in Values is ORed.
    values: []const []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// A topology selector term represents the result of label queries. A null or empty topology selector term matches no objects. The requirements of them are ANDed. It provides a subset of functionality as NodeSelectorTerm. This is an alpha feature and may change in the future.
pub const TopologySelectorTerm = struct {
    /// A list of topology selector requirements by labels.
    matchLabelExpressions: ?[]const root.io.k8s.api.core.v1.TopologySelectorLabelRequirement = null,

    pub fn validate(self: @This()) !void {
        if (self.matchLabelExpressions) |arr| for (arr) |item| try item.validate();
    }
};

/// TopologySpreadConstraint specifies how to spread matching pods among the given topology.
pub const TopologySpreadConstraint = struct {
    /// LabelSelector is used to find matching pods. Pods that match this label selector are counted to determine the number of pods in their corresponding topology domain.
    labelSelector: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.LabelSelector = null,
    /// MatchLabelKeys is a set of pod label keys to select the pods over which spreading will be calculated. The keys are used to lookup values from the incoming pod labels, those key-value labels are ANDed with labelSelector to select the group of existing pods over which spreading will be calculated for the incoming pod. The same key is forbidden to exist in both MatchLabelKeys and LabelSelector. MatchLabelKeys cannot be set when LabelSelector isn't set. Keys that don't exist in the incoming pod labels will be ignored. A null or empty list means only match against labelSelector.
    /// 
    /// This is a beta field and requires the MatchLabelKeysInPodTopologySpread feature gate to be enabled (enabled by default).
    matchLabelKeys: ?[]const []const u8 = null,
    /// MaxSkew describes the degree to which pods may be unevenly distributed. When `whenUnsatisfiable=DoNotSchedule`, it is the maximum permitted difference between the number of matching pods in the target topology and the global minimum. The global minimum is the minimum number of matching pods in an eligible domain or zero if the number of eligible domains is less than MinDomains. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 2/2/1: In this case, the global minimum is 1. | zone1 | zone2 | zone3 | |  P P  |  P P  |   P   | - if MaxSkew is 1, incoming pod can only be scheduled to zone3 to become 2/2/2; scheduling it onto zone1(zone2) would make the ActualSkew(3-1) on zone1(zone2) violate MaxSkew(1). - if MaxSkew is 2, incoming pod can be scheduled onto any zone. When `whenUnsatisfiable=ScheduleAnyway`, it is used to give higher precedence to topologies that satisfy it. It's a required field. Default value is 1 and 0 is not allowed.
    maxSkew: i64,
    /// MinDomains indicates a minimum number of eligible domains. When the number of eligible domains with matching topology keys is less than minDomains, Pod Topology Spread treats "global minimum" as 0, and then the calculation of Skew is performed. And when the number of eligible domains with matching topology keys equals or greater than minDomains, this value has no effect on scheduling. As a result, when the number of eligible domains is less than minDomains, scheduler won't schedule more than maxSkew Pods to those domains. If value is nil, the constraint behaves as if MinDomains is equal to 1. Valid values are integers greater than 0. When value is not nil, WhenUnsatisfiable must be DoNotSchedule.
    /// 
    /// For example, in a 3-zone cluster, MaxSkew is set to 2, MinDomains is set to 5 and pods with the same labelSelector spread as 2/2/2: | zone1 | zone2 | zone3 | |  P P  |  P P  |  P P  | The number of domains is less than 5(MinDomains), so "global minimum" is treated as 0. In this situation, new pod with the same labelSelector cannot be scheduled, because computed skew will be 3(3 - 0) if new Pod is scheduled to any of the three zones, it will violate MaxSkew.
    minDomains: ?i64 = null,
    /// NodeAffinityPolicy indicates how we will treat Pod's nodeAffinity/nodeSelector when calculating pod topology spread skew. Options are: - Honor: only nodes matching nodeAffinity/nodeSelector are included in the calculations. - Ignore: nodeAffinity/nodeSelector are ignored. All nodes are included in the calculations.
    /// 
    /// If this value is nil, the behavior is equivalent to the Honor policy.
    nodeAffinityPolicy: ?[]const u8 = null,
    /// NodeTaintsPolicy indicates how we will treat node taints when calculating pod topology spread skew. Options are: - Honor: nodes without taints, along with tainted nodes for which the incoming pod has a toleration, are included. - Ignore: node taints are ignored. All nodes are included.
    /// 
    /// If this value is nil, the behavior is equivalent to the Ignore policy.
    nodeTaintsPolicy: ?[]const u8 = null,
    /// TopologyKey is the key of node labels. Nodes that have a label with this key and identical values are considered to be in the same topology. We consider each <key, value> as a "bucket", and try to put balanced number of pods into each bucket. We define a domain as a particular instance of a topology. Also, we define an eligible domain as a domain whose nodes meet the requirements of nodeAffinityPolicy and nodeTaintsPolicy. e.g. If TopologyKey is "kubernetes.io/hostname", each Node is a domain of that topology. And, if TopologyKey is "topology.kubernetes.io/zone", each zone is a domain of that topology. It's a required field.
    topologyKey: []const u8,
    /// WhenUnsatisfiable indicates how to deal with a pod if it doesn't satisfy the spread constraint. - DoNotSchedule (default) tells the scheduler not to schedule it. - ScheduleAnyway tells the scheduler to schedule the pod in any location,
    ///   but giving higher precedence to topologies that would help reduce the
    ///   skew.
    /// A constraint is considered "Unsatisfiable" for an incoming pod if and only if every possible node assignment for that pod would violate "MaxSkew" on some topology. For example, in a 3-zone cluster, MaxSkew is set to 1, and pods with the same labelSelector spread as 3/1/1: | zone1 | zone2 | zone3 | | P P P |   P   |   P   | If WhenUnsatisfiable is set to DoNotSchedule, incoming pod can only be scheduled to zone2(zone3) to become 3/2/1(3/1/2) as ActualSkew(2-1) on zone2(zone3) satisfies MaxSkew(1). In other words, the cluster can still be imbalanced, but scheduler won't make it *more* imbalanced. It's a required field.
    whenUnsatisfiable: []const u8,

    pub fn validate(self: @This()) !void {
        if (self.labelSelector) |v| try v.validate();
    }
};

/// TypedLocalObjectReference contains enough information to let you locate the typed referenced object inside the same namespace.
pub const TypedLocalObjectReference = struct {
    /// APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required.
    apiGroup: ?[]const u8 = null,
    /// Kind is the type of resource being referenced
    kind: []const u8,
    /// Name is the name of resource being referenced
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// TypedObjectReference contains enough information to let you locate the typed referenced object
pub const TypedObjectReference = struct {
    /// APIGroup is the group for the resource being referenced. If APIGroup is not specified, the specified Kind must be in the core API group. For any other third-party types, APIGroup is required.
    apiGroup: ?[]const u8 = null,
    /// Kind is the type of resource being referenced
    kind: []const u8,
    /// Name is the name of resource being referenced
    name: []const u8,
    /// Namespace is the namespace of resource being referenced Note that when a namespace is specified, a gateway.networking.k8s.io/ReferenceGrant object is required in the referent namespace to allow that namespace's owner to accept the reference. See the ReferenceGrant documentation for details. (Alpha) This field requires the CrossNamespaceVolumeDataSource feature gate to be enabled.
    namespace: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// Volume represents a named volume in a pod that may be accessed by any container in the pod.
pub const Volume = struct {
    /// awsElasticBlockStore represents an AWS Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Deprecated: AWSElasticBlockStore is deprecated. All operations for the in-tree awsElasticBlockStore type are redirected to the ebs.csi.aws.com CSI driver. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
    awsElasticBlockStore: ?root.io.k8s.api.core.v1.AWSElasticBlockStoreVolumeSource = null,
    /// azureDisk represents an Azure Data Disk mount on the host and bind mount to the pod. Deprecated: AzureDisk is deprecated. All operations for the in-tree azureDisk type are redirected to the disk.csi.azure.com CSI driver.
    azureDisk: ?root.io.k8s.api.core.v1.AzureDiskVolumeSource = null,
    /// azureFile represents an Azure File Service mount on the host and bind mount to the pod. Deprecated: AzureFile is deprecated. All operations for the in-tree azureFile type are redirected to the file.csi.azure.com CSI driver.
    azureFile: ?root.io.k8s.api.core.v1.AzureFileVolumeSource = null,
    /// cephFS represents a Ceph FS mount on the host that shares a pod's lifetime. Deprecated: CephFS is deprecated and the in-tree cephfs type is no longer supported.
    cephfs: ?root.io.k8s.api.core.v1.CephFSVolumeSource = null,
    /// cinder represents a cinder volume attached and mounted on kubelets host machine. Deprecated: Cinder is deprecated. All operations for the in-tree cinder type are redirected to the cinder.csi.openstack.org CSI driver. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
    cinder: ?root.io.k8s.api.core.v1.CinderVolumeSource = null,
    /// configMap represents a configMap that should populate this volume
    configMap: ?root.io.k8s.api.core.v1.ConfigMapVolumeSource = null,
    /// csi (Container Storage Interface) represents ephemeral storage that is handled by certain external CSI drivers.
    csi: ?root.io.k8s.api.core.v1.CSIVolumeSource = null,
    /// downwardAPI represents downward API about the pod that should populate this volume
    downwardAPI: ?root.io.k8s.api.core.v1.DownwardAPIVolumeSource = null,
    /// emptyDir represents a temporary directory that shares a pod's lifetime. More info: https://kubernetes.io/docs/concepts/storage/volumes#emptydir
    emptyDir: ?root.io.k8s.api.core.v1.EmptyDirVolumeSource = null,
    /// ephemeral represents a volume that is handled by a cluster storage driver. The volume's lifecycle is tied to the pod that defines it - it will be created before the pod starts, and deleted when the pod is removed.
    /// 
    /// Use this if: a) the volume is only needed while the pod runs, b) features of normal volumes like restoring from snapshot or capacity
    ///    tracking are needed,
    /// c) the storage driver is specified through a storage class, and d) the storage driver supports dynamic volume provisioning through
    ///    a PersistentVolumeClaim (see EphemeralVolumeSource for more
    ///    information on the connection between this volume type
    ///    and PersistentVolumeClaim).
    /// 
    /// Use PersistentVolumeClaim or one of the vendor-specific APIs for volumes that persist for longer than the lifecycle of an individual pod.
    /// 
    /// Use CSI for light-weight local ephemeral volumes if the CSI driver is meant to be used that way - see the documentation of the driver for more information.
    /// 
    /// A pod can use both types of ephemeral volumes and persistent volumes at the same time.
    ephemeral: ?root.io.k8s.api.core.v1.EphemeralVolumeSource = null,
    /// fc represents a Fibre Channel resource that is attached to a kubelet's host machine and then exposed to the pod.
    fc: ?root.io.k8s.api.core.v1.FCVolumeSource = null,
    /// flexVolume represents a generic volume resource that is provisioned/attached using an exec based plugin. Deprecated: FlexVolume is deprecated. Consider using a CSIDriver instead.
    flexVolume: ?root.io.k8s.api.core.v1.FlexVolumeSource = null,
    /// flocker represents a Flocker volume attached to a kubelet's host machine. This depends on the Flocker control service being running. Deprecated: Flocker is deprecated and the in-tree flocker type is no longer supported.
    flocker: ?root.io.k8s.api.core.v1.FlockerVolumeSource = null,
    /// gcePersistentDisk represents a GCE Disk resource that is attached to a kubelet's host machine and then exposed to the pod. Deprecated: GCEPersistentDisk is deprecated. All operations for the in-tree gcePersistentDisk type are redirected to the pd.csi.storage.gke.io CSI driver. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
    gcePersistentDisk: ?root.io.k8s.api.core.v1.GCEPersistentDiskVolumeSource = null,
    /// gitRepo represents a git repository at a particular revision. Deprecated: GitRepo is deprecated. To provision a container with a git repo, mount an EmptyDir into an InitContainer that clones the repo using git, then mount the EmptyDir into the Pod's container.
    gitRepo: ?root.io.k8s.api.core.v1.GitRepoVolumeSource = null,
    /// glusterfs represents a Glusterfs mount on the host that shares a pod's lifetime. Deprecated: Glusterfs is deprecated and the in-tree glusterfs type is no longer supported.
    glusterfs: ?root.io.k8s.api.core.v1.GlusterfsVolumeSource = null,
    /// hostPath represents a pre-existing file or directory on the host machine that is directly exposed to the container. This is generally used for system agents or other privileged things that are allowed to see the host machine. Most containers will NOT need this. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
    hostPath: ?root.io.k8s.api.core.v1.HostPathVolumeSource = null,
    /// image represents an OCI object (a container image or artifact) pulled and mounted on the kubelet's host machine. The volume is resolved at pod startup depending on which PullPolicy value is provided:
    /// 
    /// - Always: the kubelet always attempts to pull the reference. Container creation will fail If the pull fails. - Never: the kubelet never pulls the reference and only uses a local image or artifact. Container creation will fail if the reference isn't present. - IfNotPresent: the kubelet pulls if the reference isn't already present on disk. Container creation will fail if the reference isn't present and the pull fails.
    /// 
    /// The volume gets re-resolved if the pod gets deleted and recreated, which means that new remote content will become available on pod recreation. A failure to resolve or pull the image during pod startup will block containers from starting and may add significant latency. Failures will be retried using normal volume backoff and will be reported on the pod reason and message. The types of objects that may be mounted by this volume are defined by the container runtime implementation on a host machine and at minimum must include all valid types supported by the container image field. The OCI object gets mounted in a single directory (spec.containers[*].volumeMounts.mountPath) by merging the manifest layers in the same way as for container images. The volume will be mounted read-only (ro) and non-executable files (noexec). Sub path mounts for containers are not supported (spec.containers[*].volumeMounts.subpath) before 1.33. The field spec.securityContext.fsGroupChangePolicy has no effect on this volume type.
    image: ?root.io.k8s.api.core.v1.ImageVolumeSource = null,
    /// iscsi represents an ISCSI Disk resource that is attached to a kubelet's host machine and then exposed to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes/#iscsi
    iscsi: ?root.io.k8s.api.core.v1.ISCSIVolumeSource = null,
    /// name of the volume. Must be a DNS_LABEL and unique within the pod. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
    name: []const u8,
    /// nfs represents an NFS mount on the host that shares a pod's lifetime More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
    nfs: ?root.io.k8s.api.core.v1.NFSVolumeSource = null,
    /// persistentVolumeClaimVolumeSource represents a reference to a PersistentVolumeClaim in the same namespace. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#persistentvolumeclaims
    persistentVolumeClaim: ?root.io.k8s.api.core.v1.PersistentVolumeClaimVolumeSource = null,
    /// photonPersistentDisk represents a PhotonController persistent disk attached and mounted on kubelets host machine. Deprecated: PhotonPersistentDisk is deprecated and the in-tree photonPersistentDisk type is no longer supported.
    photonPersistentDisk: ?root.io.k8s.api.core.v1.PhotonPersistentDiskVolumeSource = null,
    /// portworxVolume represents a portworx volume attached and mounted on kubelets host machine. Deprecated: PortworxVolume is deprecated. All operations for the in-tree portworxVolume type are redirected to the pxd.portworx.com CSI driver when the CSIMigrationPortworx feature-gate is on.
    portworxVolume: ?root.io.k8s.api.core.v1.PortworxVolumeSource = null,
    /// projected items for all in one resources secrets, configmaps, and downward API
    projected: ?root.io.k8s.api.core.v1.ProjectedVolumeSource = null,
    /// quobyte represents a Quobyte mount on the host that shares a pod's lifetime. Deprecated: Quobyte is deprecated and the in-tree quobyte type is no longer supported.
    quobyte: ?root.io.k8s.api.core.v1.QuobyteVolumeSource = null,
    /// rbd represents a Rados Block Device mount on the host that shares a pod's lifetime. Deprecated: RBD is deprecated and the in-tree rbd type is no longer supported.
    rbd: ?root.io.k8s.api.core.v1.RBDVolumeSource = null,
    /// scaleIO represents a ScaleIO persistent volume attached and mounted on Kubernetes nodes. Deprecated: ScaleIO is deprecated and the in-tree scaleIO type is no longer supported.
    scaleIO: ?root.io.k8s.api.core.v1.ScaleIOVolumeSource = null,
    /// secret represents a secret that should populate this volume. More info: https://kubernetes.io/docs/concepts/storage/volumes#secret
    secret: ?root.io.k8s.api.core.v1.SecretVolumeSource = null,
    /// storageOS represents a StorageOS volume attached and mounted on Kubernetes nodes. Deprecated: StorageOS is deprecated and the in-tree storageos type is no longer supported.
    storageos: ?root.io.k8s.api.core.v1.StorageOSVolumeSource = null,
    /// vsphereVolume represents a vSphere volume attached and mounted on kubelets host machine. Deprecated: VsphereVolume is deprecated. All operations for the in-tree vsphereVolume type are redirected to the csi.vsphere.vmware.com CSI driver.
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

/// volumeDevice describes a mapping of a raw block device within a container.
pub const VolumeDevice = struct {
    /// devicePath is the path inside of the container that the device will be mapped to.
    devicePath: []const u8,
    /// name must match the name of a persistentVolumeClaim in the pod
    name: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// VolumeMount describes a mounting of a Volume within a container.
pub const VolumeMount = struct {
    /// Path within the container at which the volume should be mounted.  Must not contain ':'.
    mountPath: []const u8,
    /// mountPropagation determines how mounts are propagated from the host to container and the other way around. When not set, MountPropagationNone is used. This field is beta in 1.10. When RecursiveReadOnly is set to IfPossible or to Enabled, MountPropagation must be None or unspecified (which defaults to None).
    mountPropagation: ?[]const u8 = null,
    /// This must match the Name of a Volume.
    name: []const u8,
    /// Mounted read-only if true, read-write otherwise (false or unspecified). Defaults to false.
    readOnly: ?bool = null,
    /// RecursiveReadOnly specifies whether read-only mounts should be handled recursively.
    /// 
    /// If ReadOnly is false, this field has no meaning and must be unspecified.
    /// 
    /// If ReadOnly is true, and this field is set to Disabled, the mount is not made recursively read-only.  If this field is set to IfPossible, the mount is made recursively read-only, if it is supported by the container runtime.  If this field is set to Enabled, the mount is made recursively read-only if it is supported by the container runtime, otherwise the pod will not be started and an error will be generated to indicate the reason.
    /// 
    /// If this field is set to IfPossible or Enabled, MountPropagation must be set to None (or be unspecified, which defaults to None).
    /// 
    /// If this field is not specified, it is treated as an equivalent of Disabled.
    recursiveReadOnly: ?[]const u8 = null,
    /// Path within the volume from which the container's volume should be mounted. Defaults to "" (volume's root).
    subPath: ?[]const u8 = null,
    /// Expanded path within the volume from which the container's volume should be mounted. Behaves similarly to SubPath but environment variable references $(VAR_NAME) are expanded using the container's environment. Defaults to "" (volume's root). SubPathExpr and SubPath are mutually exclusive.
    subPathExpr: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// VolumeMountStatus shows status of volume mounts.
pub const VolumeMountStatus = struct {
    /// MountPath corresponds to the original VolumeMount.
    mountPath: []const u8,
    /// Name corresponds to the name of the original VolumeMount.
    name: []const u8,
    /// ReadOnly corresponds to the original VolumeMount.
    readOnly: ?bool = null,
    /// RecursiveReadOnly must be set to Disabled, Enabled, or unspecified (for non-readonly mounts). An IfPossible value in the original VolumeMount must be translated to Disabled or Enabled, depending on the mount result.
    recursiveReadOnly: ?[]const u8 = null,
    /// volumeStatus represents volume-type-specific status about the mounted volume.
    volumeStatus: ?root.io.k8s.api.core.v1.VolumeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.volumeStatus) |v| try v.validate();
    }
};

/// VolumeNodeAffinity defines constraints that limit what nodes this volume can be accessed from.
pub const VolumeNodeAffinity = struct {
    /// required specifies hard node constraints that must be met.
    required: ?root.io.k8s.api.core.v1.NodeSelector = null,

    pub fn validate(self: @This()) !void {
        if (self.required) |v| try v.validate();
    }
};

/// Projection that may be projected along with other supported volume types. Exactly one of these fields must be set.
pub const VolumeProjection = struct {
    /// ClusterTrustBundle allows a pod to access the `.spec.trustBundle` field of ClusterTrustBundle objects in an auto-updating file.
    /// 
    /// Alpha, gated by the ClusterTrustBundleProjection feature gate.
    /// 
    /// ClusterTrustBundle objects can either be selected by name, or by the combination of signer name and a label selector.
    /// 
    /// Kubelet performs aggressive normalization of the PEM contents written into the pod filesystem.  Esoteric PEM features such as inter-block comments and block headers are stripped.  Certificates are deduplicated. The ordering of certificates within the file is arbitrary, and Kubelet may change the order over time.
    clusterTrustBundle: ?root.io.k8s.api.core.v1.ClusterTrustBundleProjection = null,
    /// configMap information about the configMap data to project
    configMap: ?root.io.k8s.api.core.v1.ConfigMapProjection = null,
    /// downwardAPI information about the downwardAPI data to project
    downwardAPI: ?root.io.k8s.api.core.v1.DownwardAPIProjection = null,
    /// Projects an auto-rotating credential bundle (private key and certificate chain) that the pod can use either as a TLS client or server.
    /// 
    /// Kubelet generates a private key and uses it to send a PodCertificateRequest to the named signer.  Once the signer approves the request and issues a certificate chain, Kubelet writes the key and certificate chain to the pod filesystem.  The pod does not start until certificates have been issued for each podCertificate projected volume source in its spec.
    /// 
    /// Kubelet will begin trying to rotate the certificate at the time indicated by the signer using the PodCertificateRequest.Status.BeginRefreshAt timestamp.
    /// 
    /// Kubelet can write a single file, indicated by the credentialBundlePath field, or separate files, indicated by the keyPath and certificateChainPath fields.
    /// 
    /// The credential bundle is a single file in PEM format.  The first PEM entry is the private key (in PKCS#8 format), and the remaining PEM entries are the certificate chain issued by the signer (typically, signers will return their certificate chain in leaf-to-root order).
    /// 
    /// Prefer using the credential bundle format, since your application code can read it atomically.  If you use keyPath and certificateChainPath, your application must make two separate file reads. If these coincide with a certificate rotation, it is possible that the private key and leaf certificate you read may not correspond to each other.  Your application will need to check for this condition, and re-read until they are consistent.
    /// 
    /// The named signer controls chooses the format of the certificate it issues; consult the signer implementation's documentation to learn how to use the certificates it issues.
    podCertificate: ?root.io.k8s.api.core.v1.PodCertificateProjection = null,
    /// secret information about the secret data to project
    secret: ?root.io.k8s.api.core.v1.SecretProjection = null,
    /// serviceAccountToken is information about the serviceAccountToken data to project
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

/// VolumeResourceRequirements describes the storage resource requirements for a volume.
pub const VolumeResourceRequirements = struct {
    /// Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    limits: ?std.json.Value = null,
    /// Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. Requests cannot exceed Limits. More info: https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
    requests: ?std.json.Value = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// VolumeStatus represents the status of a mounted volume. At most one of its members must be specified.
pub const VolumeStatus = struct {
    /// image represents an OCI object (a container image or artifact) pulled and mounted on the kubelet's host machine.
    image: ?root.io.k8s.api.core.v1.ImageVolumeStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.image) |v| try v.validate();
    }
};

/// Represents a vSphere volume resource.
pub const VsphereVirtualDiskVolumeSource = struct {
    /// fsType is filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
    fsType: ?[]const u8 = null,
    /// storagePolicyID is the storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
    storagePolicyID: ?[]const u8 = null,
    /// storagePolicyName is the storage Policy Based Management (SPBM) profile name.
    storagePolicyName: ?[]const u8 = null,
    /// volumePath is the path that identifies vSphere volume vmdk
    volumePath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)
pub const WeightedPodAffinityTerm = struct {
    /// Required. A pod affinity term, associated with the corresponding weight.
    podAffinityTerm: root.io.k8s.api.core.v1.PodAffinityTerm,
    /// weight associated with matching the corresponding podAffinityTerm, in the range 1-100.
    weight: i64,

    pub fn validate(self: @This()) !void {
        try self.podAffinityTerm.validate();
    }
};

/// WindowsSecurityContextOptions contain Windows-specific options and credentials.
pub const WindowsSecurityContextOptions = struct {
    /// GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field.
    gmsaCredentialSpec: ?[]const u8 = null,
    /// GMSACredentialSpecName is the name of the GMSA credential spec to use.
    gmsaCredentialSpecName: ?[]const u8 = null,
    /// HostProcess determines if a container should be run as a 'Host Process' container. All of a Pod's containers must have the same effective HostProcess value (it is not allowed to have a mix of HostProcess containers and non-HostProcess containers). In addition, if HostProcess is true then HostNetwork must also be set to true.
    hostProcess: ?bool = null,
    /// The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
    runAsUserName: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

/// WorkloadReference identifies the Workload object and PodGroup membership that a Pod belongs to. The scheduler uses this information to apply workload-aware scheduling semantics.
pub const WorkloadReference = struct {
    /// Name defines the name of the Workload object this Pod belongs to. Workload must be in the same namespace as the Pod. If it doesn't match any existing Workload, the Pod will remain unschedulable until a Workload object is created and observed by the kube-scheduler. It must be a DNS subdomain.
    name: []const u8,
    /// PodGroup is the name of the PodGroup within the Workload that this Pod belongs to. If it doesn't match any existing PodGroup within the Workload, the Pod will remain unschedulable until the Workload object is recreated and observed by the kube-scheduler. It must be a DNS label.
    podGroup: []const u8,
    /// PodGroupReplicaKey specifies the replica key of the PodGroup to which this Pod belongs. It is used to distinguish pods belonging to different replicas of the same pod group. The pod group policy is applied separately to each replica. When set, it must be a DNS label.
    podGroupReplicaKey: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

