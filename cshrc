#===============================================================================
# FILENAME:      .cshrc
# AUTHOR:        Cody Cziesler
#===============================================================================

if ($?DEBUG) echo "Loading .cshrc"

#-------------------------------------------------
# Rename the terminal
#-------------------------------------------------
if ($?TERM == 0) setenv TERM dumb

#-------------------------------------------------
# Prompt Variables
#-------------------------------------------------
if ($?prompt) then

  # tcsh Variables
  if ($?tcsh) then
    if ($?DEBUG) echo "  ... loading tcsh variables"

    # Colors!
    set   black="%{\033[1;30m%}"
    set     red="%{\033[1;31m%}"
    set   green="%{\033[1;32m%}"
    set  yellow="%{\033[1;33m%}"
    set    blue="%{\033[1;34m%}"
    set magenta="%{\033[1;35m%}"
    set    cyan="%{\033[1;36m%}"
    set   white="%{\033[1;37m%}"
    set     end="%{\033[0m%}"

    # Set some stuff up
    set autocorrect
    set autoexpand
    set autolist
    set color
    set colorcat
    set complete
    set correct=cmd
    set history=10000
    set implicitcd=verbose
    set listjobs
    set listmaxrows=20
    set nobeep
    set noclobber
    set notify
    set rmstar
    set rprompt='%p'
    set savehist=($history merge)
    set symlinks=chase
    set time = ( 5 "%E realtime, %P%% cpu (%I/%O I/O, %k sigs)" )
    set visiblebell
  endif

  # Set printer
  foreach i (fairport brighton printer-hp)
    if (`lpstat -p | cut -d' ' -f2 | grep $i` != "") then
      setenv PRINTER $i
      break
    endif
  end

  # Set editor
  foreach i (gvim vim vi)
    if (`where $i` != "") then
      setenv EDITOR $i
      break
    endif
  end

  # Set language
  setenv LANG en_US.UTF-8

  # Set environmental variables
  setenv PKG_CONFIG_PATH ~/lib/pkgconfig

  #-----------------------------------------------
  # SOS Environmental Variables
  #-----------------------------------------------
  if (`where sos` != "") then
    # SOS - disable timeout
    unsetenv SOS_TIMEOUT
    # SOS - use tkdiff instead of built in diff tool
    setenv SOS_DIFF_OPTIONS "tkdiff -L @L1 -L @L2"
  endif

  #-----------------------------------------------
  # Bindkeys
  #-----------------------------------------------
  if ($?DEBUG) echo "  ... loading bindkeys"
  bindkey "\e[1~" beginning-of-line        # home
  bindkey "\e[2~" undefined-key            # insert (disabled)
  bindkey "\e[3~" delete-char              # delete
  bindkey "\e[4~" end-of-line              # end
  bindkey "\e[5~" complete-word-back       # page up
  bindkey "\e[6~" complete-word-fwd        # page down
  bindkey -k down history-search-backward  # up
  bindkey -k up   history-search-backward  # down

  bindkey OP    run-help                 # F1
  bindkey OQ    undefined-key            # F2
  bindkey OR    undefined-key            # F3
  bindkey OS    undefined-key            # F4
  bindkey [15~  spell-line               # F5
  bindkey ^[[17~  spell-word               # F6
  bindkey ^[[18~  insert-last-word         # F7
  bindkey ^[[19~  history-search-backward  # F8
  bindkey ^[[20~  clear-screen             # F9
  bindkey ^[[21~  undefined-key            # F10
  bindkey ^[[23~  load-average             # F11
  bindkey ^[[24~  complete-word-raw        # F12

  #-----------------------------------------------
  # Source additional files
  #-----------------------------------------------
  foreach i (~/.complete ~/.cshaliases ~/.path source ~/perl5/perlbrew/etc/cshrc)
    if (-e $i) then
      if ($?DEBUG) echo "  ... loading $i"
      source $i
    endif
  end

  #-----------------------------------------------
  # xbindkeys
  #-----------------------------------------------
  if (-x $HOME/xbindkeys/bin/xbindkeys) then
    if ($?DEBUG) echo "  ... loading xbindkeys"
    pkill xbindkeys
    $HOME/xbindkeys/bin/xbindkeys
  endif

endif

#-------------------------------------------------
# Done
#-------------------------------------------------
if ($?DEBUG) echo "  ... done loading .cshrc"
