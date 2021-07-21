" X-Midas macro syntax highlighting rules for vim

" The following line must be added to the .vimrc file, in the autocmds section
"     autocmd BufRead *.txt source ~/midas.vim
" (assuming this file is named ~/midas.vim)

" - Mark Borgerding, Xetron, Sep 2002

"if getline(1) =~ '^startmacro' || getline(1) =~ '^STARTMACRO'
if match(readfile(expand("%:p")),"^startmacro")!=-1 || match(readfile(expand("%:p")),"^STARTMACRO")!=-1
  set filetype=midas
  syn clear
  syn case ignore

  " if there are commands from options trees that you'd like to add,
  " uncomment this line
  "source ~/option_trees.vim
  " and use the following perl script to extract the syntax keyword rules from
  " a commands.cfg file
  "       #!/usr/bin/perl
  "       while (<>) {
  "         next unless s/^\s*(\d*)\s*([[:alnum:]\*_]+).*/syn keyword midas_func $2/;
  "         s/\*(.+)$/\[$1\]/ or s/\*//; print;
  "       }


  syn match midas_comment "!.*"
  "syn match midas_string  /"[^"]*"/hs=s,he=e
  syn region midas_string  start=+"+  skip=+""+  end=+"+

  syn match midas_number "\<\d\+.\d\+"
  syn match midas_number "\<\d\+"
  syn match midas_number "-\<\d\+.\d\+"
  syn match midas_number "-\<\d\+"

  syn match midas_continueline "\&[ ]*$"

  syn match midas_oscall "^[ ]*\$.*"
  syn match midas_oscall "^[ ]*os.*"

  " X-Midas file qualifiers, i.e. stuff in-between parens
  syn match midas_qual '([^\(\)]*)'
  syn match midas_switch "/[^ ,]\+"hs=s,he=e

  " control flow and operators
  syn keyword midas_ctl if else endif while end[while] loop end[loop] local then startmacro endmacro
  syn keyword midas_op eq[ss] gt lt ge le ne eqt anybits allbits subs rexists fexists
  syn keyword midas_op neq[ss] ngt nlt nge nle nne neqt nanybits nallbits nsubs nrexists nfexists
  syn keyword midas_op and or

  " X-Midas baseline keywords
  syn keyword midas_func ABS[CISSA] ACQ[MOD] ADD AMFSY[NC] ARCH[IVE]
  syn keyword midas_func ASK ATT[ACH] AUDIOCD AUX[ILIARY] BEE[P] BIEXPSVI BITM[ASK]
  syn keyword midas_func BLO[CKAVG] BOO[LEAN] BREAK BRO[WSE] CALC[ULATOR]
  syn keyword midas_func CALL CATEG[ORY] CHEC[KOUT]
  syn keyword midas_func CIR[CCORL] CLKCMD CNT[LTHIN] COMM[ENT] COMPA[RE] CONC[ATENATE] CONF[IGURE]
  syn keyword midas_func CONJ[UGATE] CONS[TANT] CONT[INUE]
  syn keyword midas_func CONTOUR CONTROL CONVE[RT] CONVO[LVE] COPYH[EADER]
  syn keyword midas_func COR[RELATE] CRAYIF DARRAY DATAI[MPORT] DATA[LIST] DATE[S]
  syn keyword midas_func DBL[OG] DCLMA[P] DCLMC[ONV]
  syn keyword midas_func DEB[UG] DECA[TENATE]
  syn keyword midas_func DEF[AULTS] DEMOS DEM[UX] DETA[CH] DETE[CT]
  syn keyword midas_func DIGTC DIV[IDE] DPC[O] DR300 DSM DSMCLIENT DSMO[DULE]
  syn keyword midas_func DT202 DT300 DT700 DUA[L5000] DYN[ZOOM] ENDM[ODE] ENDS[USPEND] ENVE[LOPE]
  syn keyword midas_func ENV[IRONMENT] ERASE ERRO[R]
  syn keyword midas_func EXIT EXPL[AIN] EXPOR[T] FANI[N] FANO[UT] FASTC[ORL] FASTF[ILTER]
  syn keyword midas_func FCALC[ULATOR]
  syn keyword midas_func FCR[EATE] FFT FILEL[IST]
  syn keyword midas_func FILE[S] FILETR[ANSP]
  syn keyword midas_func FIND FIRH[LBRT] FIRP[ARKS] FIRW[IND]
  syn keyword midas_func FNAME FOR[ALL] FSKSI[M]
  syn keyword midas_func FST[ATISTICS] FSVA FSVI GATE GENEX[PLAIN]
  syn keyword midas_func GEN[MSGINC] GETDISP[LAYINFO]
  syn keyword midas_func GETV[ALUE] GO GOTO GROUP HARDL[IMIT]
  syn keyword midas_func HEA[DERMOD] HELP HIL[BERT] HISTOG[RAM]
  syn keyword midas_func HIS[TORY] HOME[PATH] HOMO[GENIZE]
  syn keyword midas_func HPS[TEP] HSHFT[DEC]
  syn keyword midas_func HW HWC[ONFIG] HWD[RIVER]
  syn keyword midas_func IMFFT IMP[ORT] INFO INTERL[EAVE] INTERP[OLATE]
  syn keyword midas_func INV[FFT] JUMP KEY[WORD] LABEL LIM[IT] LIS[SAJOUS] LOADC[ONSTANTS]
  syn keyword midas_func LOCA[TION] LOGA[RITHM]
  syn keyword midas_func LRS MAG[NITUDE] MAPMAN MAR[RAY] MASK MAS[TER] MAXM[IN] MEDIA[NFILT]
  syn keyword midas_func MEDIT MEN[U] MERG[EFILE]
  syn keyword midas_func MES[SAGE] MFFT MFI[LE] MLI[ST] MODU[LO]
  syn keyword midas_func MORPH MPO[LY] MSG[MASK] MTRAN[SLATE] MULT2[000]
  syn keyword midas_func MUL[TIPLY] MUX NEWR[ATE]
  syn keyword midas_func NOOP NORM[ALIZE] PAR[RAY] PARS[E] PAS[SFILT] PAUSE PEAKP[ICK]
  syn keyword midas_func PHA[SE] PIPE POLA[R] POLL[TC] POLYE[VAL] POLYF[IT] POLYPH[ASE] PRIF[UNC]
  syn keyword midas_func PRI[THIN] PRO[TECT] PUL[SE] QSO[RT] RAM[P] RAND[OM]
  syn keyword midas_func READID REC[ALL]
  syn keyword midas_func REF[ORMAT] REL[EASE] REM[OVE] RESET RES[ULTS] RETURN RMI[F]
  syn keyword midas_func RQF[SHIFT] RSM RTL[ISS] RTLISSD SAM SAMD[RIVER]
  syn keyword midas_func SAR[RAY] SAV[E] SAY SBT[UNER] SD350 SEDIT SETN[ODE] SETS[EED]
  syn keyword midas_func SIN[COSINE] SINKF[ILE]
  syn keyword midas_func SINKMBX SINKMSG SINKSAM SINKSB SINKSOCK[ET]
  syn keyword midas_func SKIP SLA[VE] SMO[OTH] SOCKETM[SG]
  syn keyword midas_func SOU[NDER] SOURCEF[ILE]
  syn keyword midas_func SOURCEMBX SOURCEMSG SOURCESAM SOURCESB SOURCESOCK[ET]
  syn keyword midas_func SPE[CTRA] SPL[ICE] SPLIT STATEV[ECTOR] STATI[STICS] ST[ATUS]
  syn keyword midas_func STEP STL3116 SUB[TRACT] SURFDEMO SVIC[MD]
  syn keyword midas_func SWI[TCH] SYNCP[LOT] SY[NTAX] TC[CMD]
  syn keyword midas_func THIN TIMEC[ODE]
  syn keyword midas_func TIMER TIMEX TRAC[K]
  syn keyword midas_func TRANSFFT TRANS[FORM] TRANSP[OSE]
  syn keyword midas_func TRAP TT[CMD]
  syn keyword midas_func TTUNER TUTOR TWO[DTHIN] TYPEOF UBI[QUITOUS] UNG[ROUP] UNIF[ORM] UNIT[S]
  syn keyword midas_func UNIV[ERSE] UNPR[OTECT]
  syn keyword midas_func UNW[RAP] UPD[ATE] UPS[AMPLE] UPZ[ERO] USER[ID]
  syn keyword midas_func VAL[UE] VER[IFY] WARN[ING]
  syn keyword midas_func WAV[EFORM] WHI[TENOISE] WIDGET WIN[DOW] WRA[P] WRITEID XATM[PLOT]
  syn keyword midas_func XAU[DIOCD] XBHOST XBLIB XCA[LL] XCFG[EDIT]
  syn keyword midas_func XCNTRL XCO[LORMAP] XCON[TROL] XDATA[LIST] XENV[IRONMENT]
  syn keyword midas_func XFPP XGEO XGEOE[VENT] XGEOP[LOT]
  syn keyword midas_func XMB[LD] XMBOPT XMC[HECKPROC] XMD[IR] XMK[ILL] XML[ISTPROCS] XMES[SAGE]
  syn keyword midas_func XMO[PT] XMP[ATH] XMPR[OCLIST] XMR[EMOTES] XMS[GLOG] 
  syn keyword midas_func XMV[ER] XP3[D] XPANEL XPC XPIPE XPL[OT]
  syn keyword midas_func XR[ASTER] XRTD[ISPLAY] XRTP[LOT] XRTR[ASTER] XRTSAM[VIEW] XRTSURF[ACE]
  syn keyword midas_func XSCAPE XSE[ARCH] XTEXT XTU[TOR] XVI[EW] XWI[NDOW] ZPIPE
  syn keyword midas_func DR300_TTUNER DT202_TTUNER DT300_TTUNER DT700_TTUNER STL3116[_SET]
 
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " highlighting colors
  " see vim's :help group-name for description
  "
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  hi link midas_comment Comment
  hi link midas_string Constant
  hi link midas_number Constant
  hi link midas_func Function
  hi link midas_ctl Conditional
  hi link midas_op Operator
  hi link midas_continueline SpecialChar
  hi link midas_oscall Special
  hi link midas_switch Delimiter
  hi link midas_qual Special
endif
