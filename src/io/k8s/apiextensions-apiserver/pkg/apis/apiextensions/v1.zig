// Namespace: v1

const std = @import("std");
const root = @import("../../../../../../root.zig");


pub const CustomResourceColumnDefinition = struct {
    description: ?[]const u8 = null,
    format: ?[]const u8 = null,
    jsonPath: []const u8,
    name: []const u8,
    priority: ?i64 = null,
    @"type": []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CustomResourceConversion = struct {
    strategy: []const u8,
    webhook: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.WebhookConversion = null,

    pub fn validate(self: @This()) !void {
        if (self.webhook) |v| try v.validate();
    }
};

pub const CustomResourceDefinition = struct {
    apiVersion: ?[]const u8 = null,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta = null,
    spec: root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionSpec,
    status: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.metadata) |v| try v.validate();
        try self.spec.validate();
        if (self.status) |v| try v.validate();
    }
};

pub const CustomResourceDefinitionCondition = struct {
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

pub const CustomResourceDefinitionList = struct {
    apiVersion: ?[]const u8 = null,
    items: []const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinition,
    kind: ?[]const u8 = null,
    metadata: ?root.io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta = null,

    pub fn validate(self: @This()) !void {
        for (self.items) |item| try item.validate();
        if (self.metadata) |v| try v.validate();
    }
};

pub const CustomResourceDefinitionNames = struct {
    categories: ?[]const []const u8 = null,
    kind: []const u8,
    listKind: ?[]const u8 = null,
    plural: []const u8,
    shortNames: ?[]const []const u8 = null,
    singular: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CustomResourceDefinitionSpec = struct {
    conversion: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceConversion = null,
    group: []const u8,
    names: root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionNames,
    preserveUnknownFields: ?bool = null,
    scope: []const u8,
    versions: []const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionVersion,

    pub fn validate(self: @This()) !void {
        if (self.conversion) |v| try v.validate();
        try self.names.validate();
        for (self.versions) |item| try item.validate();
    }
};

pub const CustomResourceDefinitionStatus = struct {
    acceptedNames: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionNames = null,
    conditions: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceDefinitionCondition = null,
    observedGeneration: ?i64 = null,
    storedVersions: ?[]const []const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.acceptedNames) |v| try v.validate();
        if (self.conditions) |arr| for (arr) |item| try item.validate();
    }
};

pub const CustomResourceDefinitionVersion = struct {
    additionalPrinterColumns: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceColumnDefinition = null,
    deprecated: ?bool = null,
    deprecationWarning: ?[]const u8 = null,
    name: []const u8,
    schema: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceValidation = null,
    selectableFields: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.SelectableField = null,
    served: bool,
    storage: bool,
    subresources: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceSubresources = null,

    pub fn validate(self: @This()) !void {
        if (self.additionalPrinterColumns) |arr| for (arr) |item| try item.validate();
        if (self.schema) |v| try v.validate();
        if (self.selectableFields) |arr| for (arr) |item| try item.validate();
        if (self.subresources) |v| try v.validate();
    }
};

pub const CustomResourceSubresourceScale = struct {
    labelSelectorPath: ?[]const u8 = null,
    specReplicasPath: []const u8,
    statusReplicasPath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CustomResourceSubresourceStatus = struct {

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const CustomResourceSubresources = struct {
    scale: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceSubresourceScale = null,
    status: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.CustomResourceSubresourceStatus = null,

    pub fn validate(self: @This()) !void {
        if (self.scale) |v| try v.validate();
    }
};

pub const CustomResourceValidation = struct {
    openAPIV3Schema: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaProps = null,

    pub fn validate(self: @This()) !void {
        if (self.openAPIV3Schema) |v| try v.validate();
    }
};

pub const ExternalDocumentation = struct {
    description: ?[]const u8 = null,
    url: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const JSON = std.json.Value;

pub const JSONSchemaProps = struct {
    @"$ref": ?[]const u8 = null,
    @"$schema": ?[]const u8 = null,
    additionalItems: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrBool = null,
    additionalProperties: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrBool = null,
    allOf: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaProps = null,
    anyOf: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaProps = null,
    default: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSON = null,
    definitions: ?std.json.Value = null,
    dependencies: ?std.json.Value = null,
    description: ?[]const u8 = null,
    @"enum": ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSON = null,
    example: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSON = null,
    exclusiveMaximum: ?bool = null,
    exclusiveMinimum: ?bool = null,
    externalDocs: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.ExternalDocumentation = null,
    format: ?[]const u8 = null,
    id: ?[]const u8 = null,
    items: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaPropsOrArray = null,
    maxItems: ?i64 = null,
    maxLength: ?i64 = null,
    maxProperties: ?i64 = null,
    maximum: ?f64 = null,
    minItems: ?i64 = null,
    minLength: ?i64 = null,
    minProperties: ?i64 = null,
    minimum: ?f64 = null,
    multipleOf: ?f64 = null,
    not: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaProps = null,
    nullable: ?bool = null,
    oneOf: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.JSONSchemaProps = null,
    pattern: ?[]const u8 = null,
    patternProperties: ?std.json.Value = null,
    properties: ?std.json.Value = null,
    required: ?[]const []const u8 = null,
    title: ?[]const u8 = null,
    @"type": ?[]const u8 = null,
    uniqueItems: ?bool = null,
    xKubernetesEmbeddedResource: ?bool = null,
    xKubernetesIntOrString: ?bool = null,
    xKubernetesListMapKeys: ?[]const []const u8 = null,
    xKubernetesListType: ?[]const u8 = null,
    xKubernetesMapType: ?[]const u8 = null,
    xKubernetesPreserveUnknownFields: ?bool = null,
    xKubernetesValidations: ?[]const root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.ValidationRule = null,

    pub fn validate(self: @This()) !void {
        if (self.allOf) |arr| for (arr) |item| try item.validate();
        if (self.anyOf) |arr| for (arr) |item| try item.validate();
        if (self.externalDocs) |v| try v.validate();
        if (self.not) |v| try v.validate();
        if (self.oneOf) |arr| for (arr) |item| try item.validate();
        if (self.xKubernetesValidations) |arr| for (arr) |item| try item.validate();
    }
};

pub const JSONSchemaPropsOrArray = std.json.Value;

pub const JSONSchemaPropsOrBool = std.json.Value;

pub const JSONSchemaPropsOrStringArray = std.json.Value;

pub const SelectableField = struct {
    jsonPath: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ServiceReference = struct {
    name: []const u8,
    namespace: []const u8,
    path: ?[]const u8 = null,
    port: ?i64 = null,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const ValidationRule = struct {
    fieldPath: ?[]const u8 = null,
    message: ?[]const u8 = null,
    messageExpression: ?[]const u8 = null,
    optionalOldSelf: ?bool = null,
    reason: ?[]const u8 = null,
    rule: []const u8,

    pub fn validate(self: @This()) !void {
        _ = self;
    }
};

pub const WebhookClientConfig = struct {
    caBundle: ?[]const u8 = null,
    service: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.ServiceReference = null,
    url: ?[]const u8 = null,

    pub fn validate(self: @This()) !void {
        if (self.service) |v| try v.validate();
    }
};

pub const WebhookConversion = struct {
    clientConfig: ?root.io.k8s.apiextensionsApiserver.pkg.apis.apiextensions.v1.WebhookClientConfig = null,
    conversionReviewVersions: []const []const u8,

    pub fn validate(self: @This()) !void {
        if (self.clientConfig) |v| try v.validate();
    }
};

