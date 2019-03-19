macro(cc_src_group GROUP_NAME SRC_LIST)
    # In order to work CMake's source_group macro requiers backslashes between
    # groups and subgroups. However this leads to escape hell. That's why we
    # use tildes and then replace them with backslashes at the very end
    set(DEMANGLED_GROUP)
    string(REPLACE "~" "\\\\" DEMANGLED_GROUP ${GROUP_NAME})

    source_group(${DEMANGLED_GROUP} FILES ${ARGN})

    foreach(filename ${ARGN})
        list(APPEND ${SRC_LIST} ${filename})
    endforeach()
endmacro(cc_src_group)

set(wdir ${cefName}/libcef_dll)

set(srcs)
cc_src_group(cefdll_wrapper srcs
    ${wdir}/ptr_util.h
    ${wdir}/transfer_util.cc
    ${wdir}/transfer_util.h
    ${wdir}/wrapper_types.h
)

cc_src_group(cefdll_wrapper~base srcs
    ${wdir}/base/cef_atomicops_x86_gcc.cc
    ${wdir}/base/cef_bind_helpers.cc
    ${wdir}/base/cef_callback_helpers.cc
    ${wdir}/base/cef_callback_internal.cc
    ${wdir}/base/cef_lock.cc
    ${wdir}/base/cef_lock_impl.cc
    ${wdir}/base/cef_logging.cc
    ${wdir}/base/cef_ref_counted.cc
    ${wdir}/base/cef_thread_checker_impl.cc
    ${wdir}/base/cef_weak_ptr.cc
)

if(OS_POSIX)
    cc_src_group(cefdll_wrapper~base srcs
        ${wdir}/base/cef_string16.cc
    )
endif()

cc_src_group(cefdll_wrapper~cpptoc srcs
    ${wdir}/cpptoc/accessibility_handler_cpptoc.cc
    ${wdir}/cpptoc/accessibility_handler_cpptoc.h
    ${wdir}/cpptoc/app_cpptoc.cc
    ${wdir}/cpptoc/app_cpptoc.h
    ${wdir}/cpptoc/base_ref_counted_cpptoc.cc
    ${wdir}/cpptoc/base_ref_counted_cpptoc.h
    ${wdir}/cpptoc/base_scoped_cpptoc.cc
    ${wdir}/cpptoc/base_scoped_cpptoc.h
    ${wdir}/cpptoc/browser_process_handler_cpptoc.cc
    ${wdir}/cpptoc/browser_process_handler_cpptoc.h
    ${wdir}/cpptoc/client_cpptoc.cc
    ${wdir}/cpptoc/client_cpptoc.h
    ${wdir}/cpptoc/completion_callback_cpptoc.cc
    ${wdir}/cpptoc/completion_callback_cpptoc.h
    ${wdir}/cpptoc/context_menu_handler_cpptoc.cc
    ${wdir}/cpptoc/context_menu_handler_cpptoc.h
    ${wdir}/cpptoc/cookie_visitor_cpptoc.cc
    ${wdir}/cpptoc/cookie_visitor_cpptoc.h
    ${wdir}/cpptoc/cpptoc_ref_counted.h
    ${wdir}/cpptoc/cpptoc_scoped.h
    ${wdir}/cpptoc/delete_cookies_callback_cpptoc.cc
    ${wdir}/cpptoc/delete_cookies_callback_cpptoc.h
    ${wdir}/cpptoc/dialog_handler_cpptoc.cc
    ${wdir}/cpptoc/dialog_handler_cpptoc.h
    ${wdir}/cpptoc/display_handler_cpptoc.cc
    ${wdir}/cpptoc/display_handler_cpptoc.h
    ${wdir}/cpptoc/domvisitor_cpptoc.cc
    ${wdir}/cpptoc/domvisitor_cpptoc.h
    ${wdir}/cpptoc/download_handler_cpptoc.cc
    ${wdir}/cpptoc/download_handler_cpptoc.h
    ${wdir}/cpptoc/download_image_callback_cpptoc.cc
    ${wdir}/cpptoc/download_image_callback_cpptoc.h
    ${wdir}/cpptoc/drag_handler_cpptoc.cc
    ${wdir}/cpptoc/drag_handler_cpptoc.h
    ${wdir}/cpptoc/end_tracing_callback_cpptoc.cc
    ${wdir}/cpptoc/end_tracing_callback_cpptoc.h
    ${wdir}/cpptoc/extension_handler_cpptoc.cc
    ${wdir}/cpptoc/extension_handler_cpptoc.h
    ${wdir}/cpptoc/find_handler_cpptoc.cc
    ${wdir}/cpptoc/find_handler_cpptoc.h
    ${wdir}/cpptoc/focus_handler_cpptoc.cc
    ${wdir}/cpptoc/focus_handler_cpptoc.h
    ${wdir}/cpptoc/jsdialog_handler_cpptoc.cc
    ${wdir}/cpptoc/jsdialog_handler_cpptoc.h
    ${wdir}/cpptoc/keyboard_handler_cpptoc.cc
    ${wdir}/cpptoc/keyboard_handler_cpptoc.h
    ${wdir}/cpptoc/life_span_handler_cpptoc.cc
    ${wdir}/cpptoc/life_span_handler_cpptoc.h
    ${wdir}/cpptoc/load_handler_cpptoc.cc
    ${wdir}/cpptoc/load_handler_cpptoc.h
    ${wdir}/cpptoc/menu_model_delegate_cpptoc.cc
    ${wdir}/cpptoc/menu_model_delegate_cpptoc.h
    ${wdir}/cpptoc/navigation_entry_visitor_cpptoc.cc
    ${wdir}/cpptoc/navigation_entry_visitor_cpptoc.h
    ${wdir}/cpptoc/pdf_print_callback_cpptoc.cc
    ${wdir}/cpptoc/pdf_print_callback_cpptoc.h
    ${wdir}/cpptoc/print_handler_cpptoc.cc
    ${wdir}/cpptoc/print_handler_cpptoc.h
    ${wdir}/cpptoc/read_handler_cpptoc.cc
    ${wdir}/cpptoc/read_handler_cpptoc.h
    ${wdir}/cpptoc/register_cdm_callback_cpptoc.cc
    ${wdir}/cpptoc/register_cdm_callback_cpptoc.h
    ${wdir}/cpptoc/render_handler_cpptoc.cc
    ${wdir}/cpptoc/render_handler_cpptoc.h
    ${wdir}/cpptoc/render_process_handler_cpptoc.cc
    ${wdir}/cpptoc/render_process_handler_cpptoc.h
    ${wdir}/cpptoc/request_context_handler_cpptoc.cc
    ${wdir}/cpptoc/request_context_handler_cpptoc.h
    ${wdir}/cpptoc/request_handler_cpptoc.cc
    ${wdir}/cpptoc/request_handler_cpptoc.h
    ${wdir}/cpptoc/resolve_callback_cpptoc.cc
    ${wdir}/cpptoc/resolve_callback_cpptoc.h
    ${wdir}/cpptoc/resource_bundle_handler_cpptoc.cc
    ${wdir}/cpptoc/resource_bundle_handler_cpptoc.h
    ${wdir}/cpptoc/resource_handler_cpptoc.cc
    ${wdir}/cpptoc/resource_handler_cpptoc.h
    ${wdir}/cpptoc/response_filter_cpptoc.cc
    ${wdir}/cpptoc/response_filter_cpptoc.h
    ${wdir}/cpptoc/run_file_dialog_callback_cpptoc.cc
    ${wdir}/cpptoc/run_file_dialog_callback_cpptoc.h
    ${wdir}/cpptoc/scheme_handler_factory_cpptoc.cc
    ${wdir}/cpptoc/scheme_handler_factory_cpptoc.h
    ${wdir}/cpptoc/server_handler_cpptoc.cc
    ${wdir}/cpptoc/server_handler_cpptoc.h
    ${wdir}/cpptoc/set_cookie_callback_cpptoc.cc
    ${wdir}/cpptoc/set_cookie_callback_cpptoc.h
    ${wdir}/cpptoc/string_visitor_cpptoc.cc
    ${wdir}/cpptoc/string_visitor_cpptoc.h
    ${wdir}/cpptoc/task_cpptoc.cc
    ${wdir}/cpptoc/task_cpptoc.h
    ${wdir}/cpptoc/urlrequest_client_cpptoc.cc
    ${wdir}/cpptoc/urlrequest_client_cpptoc.h
    ${wdir}/cpptoc/v8accessor_cpptoc.cc
    ${wdir}/cpptoc/v8accessor_cpptoc.h
    ${wdir}/cpptoc/v8array_buffer_release_callback_cpptoc.cc
    ${wdir}/cpptoc/v8array_buffer_release_callback_cpptoc.h
    ${wdir}/cpptoc/v8handler_cpptoc.cc
    ${wdir}/cpptoc/v8handler_cpptoc.h
    ${wdir}/cpptoc/v8interceptor_cpptoc.cc
    ${wdir}/cpptoc/v8interceptor_cpptoc.h
    ${wdir}/cpptoc/web_plugin_info_visitor_cpptoc.cc
    ${wdir}/cpptoc/web_plugin_info_visitor_cpptoc.h
    ${wdir}/cpptoc/web_plugin_unstable_callback_cpptoc.cc
    ${wdir}/cpptoc/web_plugin_unstable_callback_cpptoc.h
    ${wdir}/cpptoc/write_handler_cpptoc.cc
    ${wdir}/cpptoc/write_handler_cpptoc.h
)

cc_src_group(cefdll_wrapper~cpptoc~test srcs
    ${wdir}/cpptoc/test/translator_test_ref_ptr_client_child_cpptoc.cc
    ${wdir}/cpptoc/test/translator_test_ref_ptr_client_child_cpptoc.h
    ${wdir}/cpptoc/test/translator_test_ref_ptr_client_cpptoc.cc
    ${wdir}/cpptoc/test/translator_test_ref_ptr_client_cpptoc.h
    ${wdir}/cpptoc/test/translator_test_scoped_client_child_cpptoc.cc
    ${wdir}/cpptoc/test/translator_test_scoped_client_child_cpptoc.h
    ${wdir}/cpptoc/test/translator_test_scoped_client_cpptoc.cc
    ${wdir}/cpptoc/test/translator_test_scoped_client_cpptoc.h
)

cc_src_group(cefdll_wrapper~cpptoc~views srcs
    ${wdir}/cpptoc/views/browser_view_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/browser_view_delegate_cpptoc.h
    ${wdir}/cpptoc/views/button_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/button_delegate_cpptoc.h
    ${wdir}/cpptoc/views/menu_button_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/menu_button_delegate_cpptoc.h
    ${wdir}/cpptoc/views/panel_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/panel_delegate_cpptoc.h
    ${wdir}/cpptoc/views/textfield_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/textfield_delegate_cpptoc.h
    ${wdir}/cpptoc/views/view_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/view_delegate_cpptoc.h
    ${wdir}/cpptoc/views/window_delegate_cpptoc.cc
    ${wdir}/cpptoc/views/window_delegate_cpptoc.h
)

cc_src_group(cefdll_wrapper~ctocpp srcs
    ${wdir}/ctocpp/auth_callback_ctocpp.cc
    ${wdir}/ctocpp/auth_callback_ctocpp.h
    ${wdir}/ctocpp/before_download_callback_ctocpp.cc
    ${wdir}/ctocpp/before_download_callback_ctocpp.h
    ${wdir}/ctocpp/binary_value_ctocpp.cc
    ${wdir}/ctocpp/binary_value_ctocpp.h
    ${wdir}/ctocpp/browser_ctocpp.cc
    ${wdir}/ctocpp/browser_ctocpp.h
    ${wdir}/ctocpp/browser_host_ctocpp.cc
    ${wdir}/ctocpp/browser_host_ctocpp.h
    ${wdir}/ctocpp/callback_ctocpp.cc
    ${wdir}/ctocpp/callback_ctocpp.h
    ${wdir}/ctocpp/command_line_ctocpp.cc
    ${wdir}/ctocpp/command_line_ctocpp.h
    ${wdir}/ctocpp/context_menu_params_ctocpp.cc
    ${wdir}/ctocpp/context_menu_params_ctocpp.h
    ${wdir}/ctocpp/cookie_manager_ctocpp.cc
    ${wdir}/ctocpp/cookie_manager_ctocpp.h
    ${wdir}/ctocpp/ctocpp_ref_counted.h
    ${wdir}/ctocpp/ctocpp_scoped.h
    ${wdir}/ctocpp/dictionary_value_ctocpp.cc
    ${wdir}/ctocpp/dictionary_value_ctocpp.h
    ${wdir}/ctocpp/domdocument_ctocpp.cc
    ${wdir}/ctocpp/domdocument_ctocpp.h
    ${wdir}/ctocpp/domnode_ctocpp.cc
    ${wdir}/ctocpp/domnode_ctocpp.h
    ${wdir}/ctocpp/download_item_callback_ctocpp.cc
    ${wdir}/ctocpp/download_item_callback_ctocpp.h
    ${wdir}/ctocpp/download_item_ctocpp.cc
    ${wdir}/ctocpp/download_item_ctocpp.h
    ${wdir}/ctocpp/drag_data_ctocpp.cc
    ${wdir}/ctocpp/drag_data_ctocpp.h
    ${wdir}/ctocpp/extension_ctocpp.cc
    ${wdir}/ctocpp/extension_ctocpp.h
    ${wdir}/ctocpp/file_dialog_callback_ctocpp.cc
    ${wdir}/ctocpp/file_dialog_callback_ctocpp.h
    ${wdir}/ctocpp/frame_ctocpp.cc
    ${wdir}/ctocpp/frame_ctocpp.h
    ${wdir}/ctocpp/get_extension_resource_callback_ctocpp.cc
    ${wdir}/ctocpp/get_extension_resource_callback_ctocpp.h
    ${wdir}/ctocpp/image_ctocpp.cc
    ${wdir}/ctocpp/image_ctocpp.h
    ${wdir}/ctocpp/jsdialog_callback_ctocpp.cc
    ${wdir}/ctocpp/jsdialog_callback_ctocpp.h
    ${wdir}/ctocpp/list_value_ctocpp.cc
    ${wdir}/ctocpp/list_value_ctocpp.h
    ${wdir}/ctocpp/menu_model_ctocpp.cc
    ${wdir}/ctocpp/menu_model_ctocpp.h
    ${wdir}/ctocpp/navigation_entry_ctocpp.cc
    ${wdir}/ctocpp/navigation_entry_ctocpp.h
    ${wdir}/ctocpp/post_data_ctocpp.cc
    ${wdir}/ctocpp/post_data_ctocpp.h
    ${wdir}/ctocpp/post_data_element_ctocpp.cc
    ${wdir}/ctocpp/post_data_element_ctocpp.h
    ${wdir}/ctocpp/print_dialog_callback_ctocpp.cc
    ${wdir}/ctocpp/print_dialog_callback_ctocpp.h
    ${wdir}/ctocpp/print_job_callback_ctocpp.cc
    ${wdir}/ctocpp/print_job_callback_ctocpp.h
    ${wdir}/ctocpp/print_settings_ctocpp.cc
    ${wdir}/ctocpp/print_settings_ctocpp.h
    ${wdir}/ctocpp/process_message_ctocpp.cc
    ${wdir}/ctocpp/process_message_ctocpp.h
    ${wdir}/ctocpp/request_callback_ctocpp.cc
    ${wdir}/ctocpp/request_callback_ctocpp.h
    ${wdir}/ctocpp/request_context_ctocpp.cc
    ${wdir}/ctocpp/request_context_ctocpp.h
    ${wdir}/ctocpp/request_ctocpp.cc
    ${wdir}/ctocpp/request_ctocpp.h
    ${wdir}/ctocpp/resource_bundle_ctocpp.cc
    ${wdir}/ctocpp/resource_bundle_ctocpp.h
    ${wdir}/ctocpp/response_ctocpp.cc
    ${wdir}/ctocpp/response_ctocpp.h
    ${wdir}/ctocpp/run_context_menu_callback_ctocpp.cc
    ${wdir}/ctocpp/run_context_menu_callback_ctocpp.h
    ${wdir}/ctocpp/scheme_registrar_ctocpp.cc
    ${wdir}/ctocpp/scheme_registrar_ctocpp.h
    ${wdir}/ctocpp/select_client_certificate_callback_ctocpp.cc
    ${wdir}/ctocpp/select_client_certificate_callback_ctocpp.h
    ${wdir}/ctocpp/server_ctocpp.cc
    ${wdir}/ctocpp/server_ctocpp.h
    ${wdir}/ctocpp/sslinfo_ctocpp.cc
    ${wdir}/ctocpp/sslinfo_ctocpp.h
    ${wdir}/ctocpp/sslstatus_ctocpp.cc
    ${wdir}/ctocpp/sslstatus_ctocpp.h
    ${wdir}/ctocpp/stream_reader_ctocpp.cc
    ${wdir}/ctocpp/stream_reader_ctocpp.h
    ${wdir}/ctocpp/stream_writer_ctocpp.cc
    ${wdir}/ctocpp/stream_writer_ctocpp.h
    ${wdir}/ctocpp/task_runner_ctocpp.cc
    ${wdir}/ctocpp/task_runner_ctocpp.h
    ${wdir}/ctocpp/thread_ctocpp.cc
    ${wdir}/ctocpp/thread_ctocpp.h
    ${wdir}/ctocpp/urlrequest_ctocpp.cc
    ${wdir}/ctocpp/urlrequest_ctocpp.h
    ${wdir}/ctocpp/v8context_ctocpp.cc
    ${wdir}/ctocpp/v8context_ctocpp.h
    ${wdir}/ctocpp/v8exception_ctocpp.cc
    ${wdir}/ctocpp/v8exception_ctocpp.h
    ${wdir}/ctocpp/v8stack_frame_ctocpp.cc
    ${wdir}/ctocpp/v8stack_frame_ctocpp.h
    ${wdir}/ctocpp/v8stack_trace_ctocpp.cc
    ${wdir}/ctocpp/v8stack_trace_ctocpp.h
    ${wdir}/ctocpp/v8value_ctocpp.cc
    ${wdir}/ctocpp/v8value_ctocpp.h
    ${wdir}/ctocpp/value_ctocpp.cc
    ${wdir}/ctocpp/value_ctocpp.h
    ${wdir}/ctocpp/waitable_event_ctocpp.cc
    ${wdir}/ctocpp/waitable_event_ctocpp.h
    ${wdir}/ctocpp/web_plugin_info_ctocpp.cc
    ${wdir}/ctocpp/web_plugin_info_ctocpp.h
    ${wdir}/ctocpp/x509cert_principal_ctocpp.cc
    ${wdir}/ctocpp/x509cert_principal_ctocpp.h
    ${wdir}/ctocpp/x509certificate_ctocpp.cc
    ${wdir}/ctocpp/x509certificate_ctocpp.h
    ${wdir}/ctocpp/xml_reader_ctocpp.cc
    ${wdir}/ctocpp/xml_reader_ctocpp.h
    ${wdir}/ctocpp/zip_reader_ctocpp.cc
    ${wdir}/ctocpp/zip_reader_ctocpp.h
)

cc_src_group(cefdll_wrapper~ctocpp~test srcs
    ${wdir}/ctocpp/test/translator_test_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_child_child_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_child_child_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_child_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_child_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_ref_ptr_library_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_scoped_library_child_child_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_scoped_library_child_child_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_scoped_library_child_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_scoped_library_child_ctocpp.h
    ${wdir}/ctocpp/test/translator_test_scoped_library_ctocpp.cc
    ${wdir}/ctocpp/test/translator_test_scoped_library_ctocpp.h
)

cc_src_group(cefdll_wrapper~ctocpp~views srcs
    ${wdir}/ctocpp/views/box_layout_ctocpp.cc
    ${wdir}/ctocpp/views/box_layout_ctocpp.h
    ${wdir}/ctocpp/views/browser_view_ctocpp.cc
    ${wdir}/ctocpp/views/browser_view_ctocpp.h
    ${wdir}/ctocpp/views/button_ctocpp.cc
    ${wdir}/ctocpp/views/button_ctocpp.h
    ${wdir}/ctocpp/views/display_ctocpp.cc
    ${wdir}/ctocpp/views/display_ctocpp.h
    ${wdir}/ctocpp/views/fill_layout_ctocpp.cc
    ${wdir}/ctocpp/views/fill_layout_ctocpp.h
    ${wdir}/ctocpp/views/label_button_ctocpp.cc
    ${wdir}/ctocpp/views/label_button_ctocpp.h
    ${wdir}/ctocpp/views/layout_ctocpp.cc
    ${wdir}/ctocpp/views/layout_ctocpp.h
    ${wdir}/ctocpp/views/menu_button_ctocpp.cc
    ${wdir}/ctocpp/views/menu_button_ctocpp.h
    ${wdir}/ctocpp/views/menu_button_pressed_lock_ctocpp.cc
    ${wdir}/ctocpp/views/menu_button_pressed_lock_ctocpp.h
    ${wdir}/ctocpp/views/panel_ctocpp.cc
    ${wdir}/ctocpp/views/panel_ctocpp.h
    ${wdir}/ctocpp/views/scroll_view_ctocpp.cc
    ${wdir}/ctocpp/views/scroll_view_ctocpp.h
    ${wdir}/ctocpp/views/textfield_ctocpp.cc
    ${wdir}/ctocpp/views/textfield_ctocpp.h
    ${wdir}/ctocpp/views/view_ctocpp.cc
    ${wdir}/ctocpp/views/view_ctocpp.h
    ${wdir}/ctocpp/views/window_ctocpp.cc
    ${wdir}/ctocpp/views/window_ctocpp.h
)

cc_src_group(include srcs
    ${cefName}/include/cef_accessibility_handler.h
    ${cefName}/include/cef_app.h
    ${cefName}/include/cef_auth_callback.h
    ${cefName}/include/cef_base.h
    ${cefName}/include/cef_browser.h
    ${cefName}/include/cef_browser_process_handler.h
    ${cefName}/include/cef_callback.h
    ${cefName}/include/cef_client.h
    ${cefName}/include/cef_command_line.h
    ${cefName}/include/cef_context_menu_handler.h
    ${cefName}/include/cef_cookie.h
    ${cefName}/include/cef_crash_util.h
    ${cefName}/include/cef_dialog_handler.h
    ${cefName}/include/cef_display_handler.h
    ${cefName}/include/cef_dom.h
    ${cefName}/include/cef_download_handler.h
    ${cefName}/include/cef_download_item.h
    ${cefName}/include/cef_drag_data.h
    ${cefName}/include/cef_drag_handler.h
    ${cefName}/include/cef_extension.h
    ${cefName}/include/cef_extension_handler.h
    ${cefName}/include/cef_file_util.h
    ${cefName}/include/cef_find_handler.h
    ${cefName}/include/cef_focus_handler.h
    ${cefName}/include/cef_frame.h
    ${cefName}/include/cef_image.h
    ${cefName}/include/cef_jsdialog_handler.h
    ${cefName}/include/cef_keyboard_handler.h
    ${cefName}/include/cef_life_span_handler.h
    ${cefName}/include/cef_load_handler.h
    ${cefName}/include/cef_menu_model.h
    ${cefName}/include/cef_menu_model_delegate.h
    ${cefName}/include/cef_navigation_entry.h
    ${cefName}/include/cef_origin_whitelist.h
    ${cefName}/include/cef_parser.h
    ${cefName}/include/cef_path_util.h
    ${cefName}/include/cef_print_handler.h
    ${cefName}/include/cef_print_settings.h
    ${cefName}/include/cef_process_message.h
    ${cefName}/include/cef_process_util.h
    ${cefName}/include/cef_render_handler.h
    ${cefName}/include/cef_render_process_handler.h
    ${cefName}/include/cef_request.h
    ${cefName}/include/cef_request_context.h
    ${cefName}/include/cef_request_context_handler.h
    ${cefName}/include/cef_request_handler.h
    ${cefName}/include/cef_resource_bundle.h
    ${cefName}/include/cef_resource_bundle_handler.h
    ${cefName}/include/cef_resource_handler.h
    ${cefName}/include/cef_response.h
    ${cefName}/include/cef_response_filter.h
    ${cefName}/include/cef_scheme.h
    ${cefName}/include/cef_server.h
    ${cefName}/include/cef_ssl_info.h
    ${cefName}/include/cef_ssl_status.h
    ${cefName}/include/cef_stream.h
    ${cefName}/include/cef_string_visitor.h
    ${cefName}/include/cef_task.h
    ${cefName}/include/cef_thread.h
    ${cefName}/include/cef_trace.h
    ${cefName}/include/cef_urlrequest.h
    ${cefName}/include/cef_v8.h
    ${cefName}/include/cef_values.h
    ${cefName}/include/cef_version.h
    ${cefName}/include/cef_waitable_event.h
    ${cefName}/include/cef_web_plugin.h
    ${cefName}/include/cef_x509_certificate.h
    ${cefName}/include/cef_xml_reader.h
    ${cefName}/include/cef_zip_reader.h
)

if(OS_MACOSX)
    cc_src_group(include srcs
        ${cefName}/include/cef_application_mac.h
        ${cefName}/include/cef_sandbox_mac.h
    )
elseif(OS_WINDOWS)
    cc_src_group(include srcs
        ${cefName}/include/cef_sandbox_win.h
    )
endif()

cc_src_group(include~base srcs
    ${cefName}/include/base/cef_atomic_ref_count.h
    ${cefName}/include/base/cef_atomicops.h
    ${cefName}/include/base/cef_basictypes.h
    ${cefName}/include/base/cef_bind.h
    ${cefName}/include/base/cef_bind_helpers.h
    ${cefName}/include/base/cef_build.h
    ${cefName}/include/base/cef_callback.h
    ${cefName}/include/base/cef_callback_forward.h
    ${cefName}/include/base/cef_callback_helpers.h
    ${cefName}/include/base/cef_callback_list.h
    ${cefName}/include/base/cef_cancelable_callback.h
    ${cefName}/include/base/cef_lock.h
    ${cefName}/include/base/cef_logging.h
    ${cefName}/include/base/cef_macros.h
    ${cefName}/include/base/cef_move.h
    ${cefName}/include/base/cef_platform_thread.h
    ${cefName}/include/base/cef_ref_counted.h
    ${cefName}/include/base/cef_scoped_ptr.h
    ${cefName}/include/base/cef_string16.h
    ${cefName}/include/base/cef_template_util.h
    ${cefName}/include/base/cef_thread_checker.h
    ${cefName}/include/base/cef_trace_event.h
    ${cefName}/include/base/cef_tuple.h
    ${cefName}/include/base/cef_weak_ptr.h
)

cc_src_group(include~base~internal srcs
    ${cefName}/include/base/internal/cef_bind_internal.h
    ${cefName}/include/base/internal/cef_callback_internal.h
    ${cefName}/include/base/internal/cef_lock_impl.h
    ${cefName}/include/base/internal/cef_raw_scoped_refptr_mismatch_checker.h
    ${cefName}/include/base/internal/cef_thread_checker_impl.h
)

if(OS_LINUX)
    cc_src_group(include~base~internal srcs
        ${cefName}/include/base/internal/cef_atomicops_arm_gcc.h
        ${cefName}/include/base/internal/cef_atomicops_atomicword_compat.h
        ${cefName}/include/base/internal/cef_atomicops_x86_gcc.h
    )
elseif(OS_MACOSX)
    cc_src_group(include~base~internal srcs
        ${cefName}/include/base/internal/cef_atomicops_atomicword_compat.h
        ${cefName}/include/base/internal/cef_atomicops_mac.h
    )
elseif(OS_WINDOWS)
    cc_src_group(include~base~internal srcs
        ${cefName}/include/base/internal/cef_atomicops_x86_msvc.h
        ${cefName}/include/base/internal/cef_bind_internal_win.h
    )
endif()

cc_src_group(include~capi srcs
    ${cefName}/include/capi/cef_accessibility_handler_capi.h
    ${cefName}/include/capi/cef_app_capi.h
    ${cefName}/include/capi/cef_auth_callback_capi.h
    ${cefName}/include/capi/cef_base_capi.h
    ${cefName}/include/capi/cef_browser_capi.h
    ${cefName}/include/capi/cef_browser_process_handler_capi.h
    ${cefName}/include/capi/cef_callback_capi.h
    ${cefName}/include/capi/cef_client_capi.h
    ${cefName}/include/capi/cef_command_line_capi.h
    ${cefName}/include/capi/cef_context_menu_handler_capi.h
    ${cefName}/include/capi/cef_cookie_capi.h
    ${cefName}/include/capi/cef_crash_util_capi.h
    ${cefName}/include/capi/cef_dialog_handler_capi.h
    ${cefName}/include/capi/cef_display_handler_capi.h
    ${cefName}/include/capi/cef_dom_capi.h
    ${cefName}/include/capi/cef_download_handler_capi.h
    ${cefName}/include/capi/cef_download_item_capi.h
    ${cefName}/include/capi/cef_drag_data_capi.h
    ${cefName}/include/capi/cef_drag_handler_capi.h
    ${cefName}/include/capi/cef_extension_capi.h
    ${cefName}/include/capi/cef_extension_handler_capi.h
    ${cefName}/include/capi/cef_file_util_capi.h
    ${cefName}/include/capi/cef_find_handler_capi.h
    ${cefName}/include/capi/cef_focus_handler_capi.h
    ${cefName}/include/capi/cef_frame_capi.h
    ${cefName}/include/capi/cef_image_capi.h
    ${cefName}/include/capi/cef_jsdialog_handler_capi.h
    ${cefName}/include/capi/cef_keyboard_handler_capi.h
    ${cefName}/include/capi/cef_life_span_handler_capi.h
    ${cefName}/include/capi/cef_load_handler_capi.h
    ${cefName}/include/capi/cef_menu_model_capi.h
    ${cefName}/include/capi/cef_menu_model_delegate_capi.h
    ${cefName}/include/capi/cef_navigation_entry_capi.h
    ${cefName}/include/capi/cef_origin_whitelist_capi.h
    ${cefName}/include/capi/cef_parser_capi.h
    ${cefName}/include/capi/cef_path_util_capi.h
    ${cefName}/include/capi/cef_print_handler_capi.h
    ${cefName}/include/capi/cef_print_settings_capi.h
    ${cefName}/include/capi/cef_process_message_capi.h
    ${cefName}/include/capi/cef_process_util_capi.h
    ${cefName}/include/capi/cef_render_handler_capi.h
    ${cefName}/include/capi/cef_render_process_handler_capi.h
    ${cefName}/include/capi/cef_request_capi.h
    ${cefName}/include/capi/cef_request_context_capi.h
    ${cefName}/include/capi/cef_request_context_handler_capi.h
    ${cefName}/include/capi/cef_request_handler_capi.h
    ${cefName}/include/capi/cef_resource_bundle_capi.h
    ${cefName}/include/capi/cef_resource_bundle_handler_capi.h
    ${cefName}/include/capi/cef_resource_handler_capi.h
    ${cefName}/include/capi/cef_response_capi.h
    ${cefName}/include/capi/cef_response_filter_capi.h
    ${cefName}/include/capi/cef_scheme_capi.h
    ${cefName}/include/capi/cef_server_capi.h
    ${cefName}/include/capi/cef_ssl_info_capi.h
    ${cefName}/include/capi/cef_ssl_status_capi.h
    ${cefName}/include/capi/cef_stream_capi.h
    ${cefName}/include/capi/cef_string_visitor_capi.h
    ${cefName}/include/capi/cef_task_capi.h
    ${cefName}/include/capi/cef_thread_capi.h
    ${cefName}/include/capi/cef_trace_capi.h
    ${cefName}/include/capi/cef_urlrequest_capi.h
    ${cefName}/include/capi/cef_v8_capi.h
    ${cefName}/include/capi/cef_values_capi.h
    ${cefName}/include/capi/cef_waitable_event_capi.h
    ${cefName}/include/capi/cef_web_plugin_capi.h
    ${cefName}/include/capi/cef_x509_certificate_capi.h
    ${cefName}/include/capi/cef_xml_reader_capi.h
    ${cefName}/include/capi/cef_zip_reader_capi.h
)

cc_src_group(include~capi~test srcs
    ${cefName}/include/capi/test/cef_test_helpers_capi.h
    ${cefName}/include/capi/test/cef_translator_test_capi.h
)

cc_src_group(include~capi~views srcs
    ${cefName}/include/capi/views/cef_box_layout_capi.h
    ${cefName}/include/capi/views/cef_browser_view_capi.h
    ${cefName}/include/capi/views/cef_browser_view_delegate_capi.h
    ${cefName}/include/capi/views/cef_button_capi.h
    ${cefName}/include/capi/views/cef_button_delegate_capi.h
    ${cefName}/include/capi/views/cef_display_capi.h
    ${cefName}/include/capi/views/cef_fill_layout_capi.h
    ${cefName}/include/capi/views/cef_label_button_capi.h
    ${cefName}/include/capi/views/cef_layout_capi.h
    ${cefName}/include/capi/views/cef_menu_button_capi.h
    ${cefName}/include/capi/views/cef_menu_button_delegate_capi.h
    ${cefName}/include/capi/views/cef_panel_capi.h
    ${cefName}/include/capi/views/cef_panel_delegate_capi.h
    ${cefName}/include/capi/views/cef_scroll_view_capi.h
    ${cefName}/include/capi/views/cef_textfield_capi.h
    ${cefName}/include/capi/views/cef_textfield_delegate_capi.h
    ${cefName}/include/capi/views/cef_view_capi.h
    ${cefName}/include/capi/views/cef_view_delegate_capi.h
    ${cefName}/include/capi/views/cef_window_capi.h
    ${cefName}/include/capi/views/cef_window_delegate_capi.h
)

cc_src_group(include~internal srcs
    ${cefName}/include/internal/cef_export.h
    ${cefName}/include/internal/cef_logging_internal.h
    ${cefName}/include/internal/cef_ptr.h
    ${cefName}/include/internal/cef_string.h
    ${cefName}/include/internal/cef_string_list.h
    ${cefName}/include/internal/cef_string_map.h
    ${cefName}/include/internal/cef_string_multimap.h
    ${cefName}/include/internal/cef_string_types.h
    ${cefName}/include/internal/cef_string_wrappers.h
    ${cefName}/include/internal/cef_thread_internal.h
    ${cefName}/include/internal/cef_time.h
    ${cefName}/include/internal/cef_trace_event_internal.h
    ${cefName}/include/internal/cef_types.h
    ${cefName}/include/internal/cef_types_wrappers.h
)
if(OS_LINUX)
    cc_src_group(include~internal srcs
        ${cefName}/include/internal/cef_linux.h
        ${cefName}/include/internal/cef_types_linux.h
    )
elseif(OS_MACOSX)
    cc_src_group(include~internal srcs
        ${cefName}/include/internal/cef_mac.h
        ${cefName}/include/internal/cef_types_mac.h
    )
elseif(OS_WINDOWS)
    cc_src_group(include~internal srcs
        ${cefName}/include/internal/cef_types_win.h
        ${cefName}/include/internal/cef_win.h
    )
endif()

cc_src_group(include~test srcs
    ${cefName}/include/test/cef_test_helpers.h
    ${cefName}/include/test/cef_translator_test.h
)

cc_src_group(include~views srcs
    ${cefName}/include/views/cef_box_layout.h
    ${cefName}/include/views/cef_browser_view.h
    ${cefName}/include/views/cef_browser_view_delegate.h
    ${cefName}/include/views/cef_button.h
    ${cefName}/include/views/cef_button_delegate.h
    ${cefName}/include/views/cef_display.h
    ${cefName}/include/views/cef_fill_layout.h
    ${cefName}/include/views/cef_label_button.h
    ${cefName}/include/views/cef_layout.h
    ${cefName}/include/views/cef_menu_button.h
    ${cefName}/include/views/cef_menu_button_delegate.h
    ${cefName}/include/views/cef_panel.h
    ${cefName}/include/views/cef_panel_delegate.h
    ${cefName}/include/views/cef_scroll_view.h
    ${cefName}/include/views/cef_textfield.h
    ${cefName}/include/views/cef_textfield_delegate.h
    ${cefName}/include/views/cef_view.h
    ${cefName}/include/views/cef_view_delegate.h
    ${cefName}/include/views/cef_window.h
    ${cefName}/include/views/cef_window_delegate.h
)

cc_src_group(include~wrapper srcs
    ${cefName}/include/wrapper/cef_byte_read_handler.h
    ${cefName}/include/wrapper/cef_closure_task.h
    ${cefName}/include/wrapper/cef_helpers.h
    ${cefName}/include/wrapper/cef_message_router.h
    ${cefName}/include/wrapper/cef_resource_manager.h
    ${cefName}/include/wrapper/cef_scoped_temp_dir.h
    ${cefName}/include/wrapper/cef_stream_resource_handler.h
    ${cefName}/include/wrapper/cef_xml_object.h
    ${cefName}/include/wrapper/cef_zip_archive.h
)
if(OS_MACOSX)
    cc_src_group(include~wrapper srcs
        ${cefName}/include/wrapper/cef_library_loader.h
    )
endif()

cc_src_group(cefdll_wrapper~wrapper srcs
    ${wdir}/wrapper/cef_browser_info_map.h
    ${wdir}/wrapper/cef_byte_read_handler.cc
    ${wdir}/wrapper/cef_closure_task.cc
    ${wdir}/wrapper/cef_message_router.cc
    ${wdir}/wrapper/cef_resource_manager.cc
    ${wdir}/wrapper/cef_scoped_temp_dir.cc
    ${wdir}/wrapper/cef_stream_resource_handler.cc
    ${wdir}/wrapper/cef_xml_object.cc
    ${wdir}/wrapper/cef_zip_archive.cc
    ${wdir}/wrapper/libcef_dll_wrapper.cc
    ${wdir}/wrapper/libcef_dll_wrapper2.cc
)
if(OS_MACOSX)
    cc_src_group(cefdll_wrapper~wrapper srcs
        ${wdir}/wrapper/cef_library_loader_mac.mm
        ${wdir}/wrapper/libcef_dll_dylib.cc
    )
endif()