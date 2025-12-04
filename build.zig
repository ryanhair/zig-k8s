const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.addModule("client", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "client",
        .root_module = mod,
    });
    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .root_module = mod,
    });
    const run_main_tests = b.addRunArtifact(main_tests);
    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_main_tests.step);

    const list_pods_mod = b.createModule(.{
        .root_source_file = b.path("examples/list_pods.zig"),
        .target = target,
        .optimize = optimize,
    });
    list_pods_mod.addImport("k8s", mod);

    const list_pods_exe = b.addExecutable(.{
        .name = "list-pods",
        .root_module = list_pods_mod,
    });
    b.installArtifact(list_pods_exe);

    const run_list_pods = b.addRunArtifact(list_pods_exe);
    const run_list_pods_step = b.step("run-list-pods", "Run list-pods example");
    run_list_pods_step.dependOn(&run_list_pods.step);

    const create_deployment_mod = b.createModule(.{
        .root_source_file = b.path("examples/create_deployment.zig"),
        .target = target,
        .optimize = optimize,
    });
    create_deployment_mod.addImport("k8s", mod);

    const create_deployment_exe = b.addExecutable(.{
        .name = "create-deployment",
        .root_module = create_deployment_mod,
    });
    b.installArtifact(create_deployment_exe);

    const run_create_deployment = b.addRunArtifact(create_deployment_exe);
    const run_create_deployment_step = b.step("run-create-deployment", "Run create-deployment example");
    run_create_deployment_step.dependOn(&run_create_deployment.step);

    const manage_service_mod = b.createModule(.{
        .root_source_file = b.path("examples/manage_service.zig"),
        .target = target,
        .optimize = optimize,
    });
    manage_service_mod.addImport("k8s", mod);

    const manage_service_exe = b.addExecutable(.{
        .name = "manage-service",
        .root_module = manage_service_mod,
    });
    b.installArtifact(manage_service_exe);

    const run_manage_service = b.addRunArtifact(manage_service_exe);
    const run_manage_service_step = b.step("run-manage-service", "Run manage-service example");
    run_manage_service_step.dependOn(&run_manage_service.step);

    const watch_pods_mod = b.createModule(.{
        .root_source_file = b.path("examples/watch_pods.zig"),
        .target = target,
        .optimize = optimize,
    });
    watch_pods_mod.addImport("k8s", mod);

    const watch_pods_exe = b.addExecutable(.{
        .name = "watch-pods",
        .root_module = watch_pods_mod,
    });
    b.installArtifact(watch_pods_exe);

    const run_watch_pods = b.addRunArtifact(watch_pods_exe);
    const run_watch_pods_step = b.step("run-watch-pods", "Run watch-pods example");
    run_watch_pods_step.dependOn(&run_watch_pods.step);

    const manage_configmap_mod = b.createModule(.{
        .root_source_file = b.path("examples/manage_configmap.zig"),
        .target = target,
        .optimize = optimize,
    });
    manage_configmap_mod.addImport("k8s", mod);

    const manage_configmap_exe = b.addExecutable(.{
        .name = "manage-configmap",
        .root_module = manage_configmap_mod,
    });
    b.installArtifact(manage_configmap_exe);

    const run_manage_configmap = b.addRunArtifact(manage_configmap_exe);
    const run_manage_configmap_step = b.step("run-manage-configmap", "Run manage-configmap example");
    run_manage_configmap_step.dependOn(&run_manage_configmap.step);

    const pod_logs_mod = b.createModule(.{
        .root_source_file = b.path("examples/pod_logs.zig"),
        .target = target,
        .optimize = optimize,
    });
    pod_logs_mod.addImport("k8s", mod);

    const pod_logs_exe = b.addExecutable(.{
        .name = "pod-logs",
        .root_module = pod_logs_mod,
    });
    b.installArtifact(pod_logs_exe);

    const run_pod_logs = b.addRunArtifact(pod_logs_exe);
    const run_pod_logs_step = b.step("run-pod-logs", "Run pod-logs example");
    run_pod_logs_step.dependOn(&run_pod_logs.step);

    const patch_deployment_mod = b.createModule(.{
        .root_source_file = b.path("examples/patch_deployment.zig"),
        .target = target,
        .optimize = optimize,
    });
    patch_deployment_mod.addImport("k8s", mod);

    const patch_deployment_exe = b.addExecutable(.{
        .name = "patch-deployment",
        .root_module = patch_deployment_mod,
    });
    b.installArtifact(patch_deployment_exe);

    const run_patch_deployment = b.addRunArtifact(patch_deployment_exe);
    const run_patch_deployment_step = b.step("run-patch-deployment", "Run patch-deployment example");
    run_patch_deployment_step.dependOn(&run_patch_deployment.step);
}
