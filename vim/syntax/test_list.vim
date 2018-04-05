"-------------------------------------------------------------------------------
" Vim syntax file
" Language:         test list files
" Maintainer:       Cody Cziesler
" Latest Revision:  14 Aug 2012
"-------------------------------------------------------------------------------

if exists("b:current_syntax")
  finish
endif

syn keyword tl_todo    containedin=tl_comment contained TODO FIXME XXX NOTE ???

"-------------------------------------------------------------------------------
"  Keywords
"-------------------------------------------------------------------------------

syn region  tl_plarg_line         oneline start=/^\s\+\<plarg\>/ end=/\n/                                     contains=tl_plarg,tl_keyword,tl_comment,tl_colon
syn match   tl_plarg              contained /+\?\<[A-Z_a-z0-9.=]\+\>/

syn region  tl_vlogdef_line       oneline start=/^\s\+vlogdef/ end=/\n/                                       contains=tl_vlogdef,tl_keyword,tl_comment,tl_colon
syn match   tl_vlogdef            contained /\<[A-Za-z0-9_.=]\+\>/

syn region  tl_vlibdir_line       oneline start=/^\s\+vlibdir/ end=/\n/                                       contains=tl_vlibdir,tl_keyword,tl_comment,tl_colon
syn match   tl_vlibdir            contained /\<[A-Za-z0-9_.=]\+\>/

syn region  tl_casmdef_line       oneline start=/^\s\+casmdef/ end=/\n/                                       contains=tl_casmdef,tl_keyword,tl_comment,tl_colon
syn match   tl_casmdef            contained /-\<D[A-Za-z0-9_.=]\+\>/

syn region  tl_inc_line           oneline start=/^\s\+\<\(inc_common\|inc_testname\|inc_regname\|inc_regname_ifvar\|inc_regname_ifnvar\|exc_testname\|rpt_testname\|reg_common\)\>/ end=/\n/ contains=tl_inc,tl_keyword,tl_comment,tl_inc_mult,tl_colon
syn match   tl_inc                contained /\<[A-Za-z_0-9]\+\>/
syn match   tl_inc_mult           contained /\*/

syn region  tl_simtime_line       oneline start=/^\s\+sim_time/ end=/\n/                                      contains=tl_time,tl_keyword,tl_comment,tl_colon
syn match   tl_time               contained /\<[0-9]\+\>/

syn region  tl_cp_file_line       oneline start=/^\s\+cp_file/ end=/\n/                                       contains=tl_files,tl_sp,tl_keyword,tl_comment,tl_colon
syn match   tl_files              contained /[A-Za-z0-9_\.<\*>\/]\+/
syn match   tl_sp                 contained '>>'

syn region  tl_datasubdir_line    oneline start=/^\s\+\<datasubdir\>/ end=/\n/                                contains=tl_files,tl_keyword,tl_comment,tl_colon

syn region  tl_firmware_line      oneline start=/^\s\+\(firmware\|rom_code\)/ end=/\n/                        contains=tl_files,tl_keyword,tl_comment,tl_colon

syn region  tl_reg_test_name_line oneline start=/^\s*\<\(testname\|common\|regname\)\>\s*:/ end=/\n/           contains=tl_comment,tl_function_start,tl_keyword,tl_name,tl_colon
syn keyword tl_function_start     contained regname common testname
syn match   tl_name               contained /\<[A-Za-z0-9_]\+\>/
syn keyword tl_function_end       end_regname end_common end

syn region  tl_sys_line           oneline start=/^\s\+sys_/ end=/\n/                                          contains=tl_keyword,tl_comment,tl_cmd,tl_colon
syn match   tl_cmd                contained /`.*`/

syn region  tl_ok_line            oneline start=/^\s\+.\+_ok/ end=/\n/                                        contains=tl_keyword,tl_comment,tl_okay,tl_colon
syn match   tl_okay               contained /".*"/

syn region  tl_seed_line          oneline start=/^\s*\<testseed\>/ end=/\n/                                   contains=tl_seed,tl_comment,tl_keyword,tl_colon
syn match   tl_seed               contained /\(RANDOM\|[0-9]\+\)/

syn keyword tl_keyword            inc_testname inc_common inc_regname
syn keyword tl_keyword            inc_regname_ifvar inc_regname_ifnvar
syn keyword tl_keyword            datasubdir rom_code plarg cp_file firmware
syn keyword tl_keyword            flash_code hex_file fw_incdirs
syn keyword tl_keyword            sim_time sys_presim sys_postsim rpt_testname
syn keyword tl_keyword            sys_precom sys_postcom sys_initial
syn keyword tl_keyword            ams_config fwsubdir sim_mode testbench testseed
syn keyword tl_keyword            vlibdir vlogdef casmdef vhdlan_sw vlogan_sw vcs_sw sim_sw
syn keyword tl_keyword            exp_err_cnt exp_fail_cnt exp_viol_cnt exp_warn_cnt
syn keyword tl_keyword            errs_ok warns_ok viols_ok fails_ok tmpviols_ok
syn keyword tl_keyword            reqd_msgs exc_testname waves fsdb
syn keyword tl_keyword            ctl_params reg_common xactors owner
syn keyword tl_keyword            c_comp_sw fw_comp_sw asm_comp_sw
syn keyword tl_keyword            tname_prefix simulator pp_script

syn keyword tl_colon              :

syn match   tl_comment "//.*$" contains=tl_todo,@Spell

"-------------------------------------------------------------------------------
"  Setup syntax highlighting
"-------------------------------------------------------------------------------
let b:current_syntax = "test_list"
hi def link tl_name           Identifier
hi def link tl_inc            Identifier

hi def link tl_todo           Todo

hi def link tl_comment        Comment

hi def link tl_keyword        Keyword

hi def link tl_function_start Function
hi def link tl_function_end   Function

hi def link tl_plarg          Constant
hi def link tl_vlogdef        Constant
hi def link tl_casmdef        Constant

hi def link tl_files          String
hi def link tl_cmd            String
hi def link tl_okay           String

hi def link tl_sp             Operator
hi def link tl_inc_mult       Operator

hi def link tl_time           Number
hi def link tl_seed           Number
