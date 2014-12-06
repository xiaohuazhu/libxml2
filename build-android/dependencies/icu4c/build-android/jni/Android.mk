LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

common_src_files = \
appendable.cpp                 ucnv_ext.cpp \
bmpset.cpp                     ucnv_io.cpp \
brkeng.cpp                     ucnv_lmb.c \
brkiter.cpp                    ucnv_set.c \
bytestream.cpp                 ucnv_u16.c \
bytestrie.cpp                  ucnv_u32.c \
bytestriebuilder.cpp           ucnv_u7.c \
bytestrieiterator.cpp          ucnv_u8.c \
caniter.cpp                    ucnvbocu.cpp \
chariter.cpp                   ucnvdisp.c \
charstr.cpp                    ucnvhz.c \
cmemory.c                      ucnvisci.c \
cstring.c                      ucnvlat1.c \
cwchar.c                       ucnvmbcs.cpp \
dictbe.cpp                     ucnvscsu.c \
dictionarydata.cpp             ucnvsel.cpp \
dtintrv.cpp                    ucol_swp.cpp \
errorcode.cpp                  udata.cpp \
filterednormalizer2.cpp        udatamem.c \
icudataver.c                   udataswp.c \
icuplug.cpp                    uenum.c \
listformatter.cpp              uhash.c \
loadednormalizer2impl.cpp      uhash_us.cpp \
locavailable.cpp               uidna.cpp \
locbased.cpp                   uinit.cpp \
locdispnames.cpp               uinvchar.c \
locid.cpp                      uiter.cpp \
loclikely.cpp                  ulist.c \
locmap.c                       uloc.cpp \
locresdata.cpp                 uloc_keytype.cpp \
locutil.cpp                    uloc_tag.c \
messagepattern.cpp             umapfile.c \
normalizer2.cpp                umath.c \
normalizer2impl.cpp            umutex.cpp \
normlzr.cpp                    unames.cpp \
parsepos.cpp                   unifiedcache.cpp \
patternprops.cpp               unifilt.cpp \
propname.cpp                   unifunct.cpp \
propsvec.c                     uniset.cpp \
punycode.cpp                   uniset_closure.cpp \
putil.cpp                      uniset_props.cpp \
rbbi.cpp                       unisetspan.cpp \
rbbidata.cpp                   unistr.cpp \
rbbinode.cpp                   unistr_case.cpp \
rbbirb.cpp                     unistr_case_locale.cpp \
rbbiscan.cpp                   unistr_cnv.cpp \
rbbisetb.cpp                   unistr_props.cpp \
rbbistbl.cpp                   unistr_titlecase_brkiter.cpp \
rbbitblb.cpp                   unorm.cpp \
resbund.cpp                    unormcmp.cpp \
resbund_cnv.cpp                uobject.cpp \
ruleiter.cpp                   uprops.cpp \
schriter.cpp                   ures_cnv.c \
serv.cpp                       uresbund.cpp \
servlk.cpp                     uresdata.c \
servlkf.cpp                    usc_impl.c \
servls.cpp                     uscript.c \
servnotf.cpp                   uscript_props.cpp \
servrbf.cpp                    uset.cpp \
servslkf.cpp                   uset_props.cpp \
sharedobject.cpp               usetiter.cpp \
simplepatternformatter.cpp     ushape.cpp \
stringpiece.cpp                usprep.cpp \
stringtriebuilder.cpp          ustack.cpp \
uarrsort.c                     ustr_cnv.cpp \
ubidi.c                        ustr_titlecase_brkiter.cpp \
ubidi_props.c                  ustr_wcs.cpp \
ubidiln.c                      ustrcase.cpp \
ubidiwrt.c                     ustrcase_locale.cpp \
ubrk.cpp                       ustrenum.cpp \
ucase.cpp                      ustrfmt.c \
ucasemap.cpp                   ustring.cpp \
ucasemap_titlecase_brkiter.cpp ustrtrns.cpp \
ucat.c                         utext.cpp \
uchar.c                        utf_impl.c \
ucharstrie.cpp                 util.cpp \
ucharstriebuilder.cpp          util_props.cpp \
ucharstrieiterator.cpp         utrace.c \
uchriter.cpp                   utrie.cpp \
ucln_cmn.cpp                   utrie2.cpp \
ucmndata.c                     utrie2_builder.cpp \
ucnv.c                         uts46.cpp \
ucnv2022.cpp                   utypes.c \
ucnv_bld.cpp                   uvector.cpp \
ucnv_cb.c                      uvectr32.cpp \
ucnv_cnv.c                     uvectr64.cpp \
ucnv_ct.c                      wintz.c \
ucnv_err.c

common_src_files += ../stubdata/stubdata.c

i18n_src_files = \
alphaindex.cpp                olsontz.cpp \
anytrans.cpp                  persncal.cpp \
astro.cpp                     plurfmt.cpp \
basictz.cpp                   plurrule.cpp \
bocsu.cpp                     quant.cpp \
brktrans.cpp                  quantityformatter.cpp \
buddhcal.cpp                  rbnf.cpp \
calendar.cpp                  rbt.cpp \
casetrn.cpp                   rbt_data.cpp \
cecal.cpp                     rbt_pars.cpp \
chnsecal.cpp                  rbt_rule.cpp \
choicfmt.cpp                  rbt_set.cpp \
coleitr.cpp                   rbtz.cpp \
coll.cpp                      regexcmp.cpp \
collation.cpp                 regeximp.cpp \
collationbasedatabuilder.cpp  regexst.cpp \
collationbuilder.cpp          regextxt.cpp \
collationcompare.cpp          region.cpp \
collationdata.cpp             reldatefmt.cpp \
collationdatabuilder.cpp      reldtfmt.cpp \
collationdatareader.cpp       rematch.cpp \
collationdatawriter.cpp       remtrans.cpp \
collationfastlatin.cpp        repattrn.cpp \
collationfastlatinbuilder.cpp rulebasedcollator.cpp \
collationfcd.cpp              scientificformathelper.cpp \
collationiterator.cpp         scriptset.cpp \
collationkeys.cpp             search.cpp \
collationroot.cpp             selfmt.cpp \
collationrootelements.cpp     sharedbreakiterator.cpp \
collationruleparser.cpp       simpletz.cpp \
collationsets.cpp             smpdtfmt.cpp \
collationsettings.cpp         smpdtfst.cpp \
collationtailoring.cpp        sortkey.cpp \
collationweights.cpp          strmatch.cpp \
compactdecimalformat.cpp      strrepl.cpp \
coptccal.cpp                  stsearch.cpp \
cpdtrans.cpp                  taiwncal.cpp \
csdetect.cpp                  timezone.cpp \
csmatch.cpp                   titletrn.cpp \
csr2022.cpp                   tmunit.cpp \
csrecog.cpp                   tmutamt.cpp \
csrmbcs.cpp                   tmutfmt.cpp \
csrsbcs.cpp                   tolowtrn.cpp \
csrucode.cpp                  toupptrn.cpp \
csrutf8.cpp                   translit.cpp \
curramt.cpp                   transreg.cpp \
currfmt.cpp                   tridpars.cpp \
currpinf.cpp                  tzfmt.cpp \
currunit.cpp                  tzgnames.cpp \
dangical.cpp                  tznames.cpp \
datefmt.cpp                   tznames_impl.cpp \
dcfmtsym.cpp                  tzrule.cpp \
decContext.c                  tztrans.cpp \
decNumber.c                   ucal.cpp \
decfmtst.cpp                  ucln_in.cpp \
decimalformatpattern.cpp      ucol.cpp \
decimfmt.cpp                  ucol_res.cpp \
digitlst.cpp                  ucol_sit.cpp \
dtfmtsym.cpp                  ucoleitr.cpp \
dtitvfmt.cpp                  ucsdet.cpp \
dtitvinf.cpp                  ucurr.cpp \
dtptngen.cpp                  udat.cpp \
dtrule.cpp                    udateintervalformat.cpp \
esctrn.cpp                    udatpg.cpp \
ethpccal.cpp                  uitercollationiterator.cpp \
filteredbrk.cpp               ulocdata.c \
fmtable.cpp                   umsg.cpp \
fmtable_cnv.cpp               unesctrn.cpp \
format.cpp                    uni2name.cpp \
fphdlimp.cpp                  unum.cpp \
fpositer.cpp                  unumsys.cpp \
funcrepl.cpp                  upluralrules.cpp \
gender.cpp                    uregex.cpp \
gregocal.cpp                  uregexc.cpp \
gregoimp.cpp                  uregion.cpp \
hebrwcal.cpp                  usearch.cpp \
identifier_info.cpp           uspoof.cpp \
indiancal.cpp                 uspoof_build.cpp \
inputext.cpp                  uspoof_conf.cpp \
islamcal.cpp                  uspoof_impl.cpp \
japancal.cpp                  uspoof_wsconf.cpp \
locdspnm.cpp                  utf16collationiterator.cpp \
measfmt.cpp                   utf8collationiterator.cpp \
measunit.cpp                  utmscale.c \
measure.cpp                   utrans.cpp \
msgfmt.cpp                    vtzone.cpp \
name2uni.cpp                  vzone.cpp \
nfrs.cpp                      windtfmt.cpp \
nfrule.cpp                    winnmfmt.cpp \
nfsubs.cpp                    wintzimpl.cpp \
nortrans.cpp                  zonemeta.cpp \
nultrans.cpp                  zrule.cpp \
numfmt.cpp                    ztrans.cpp \
numsys.cpp

src_dir := $(LOCAL_PATH)/../../source
common_src_files := $(addprefix $(src_dir)/common/, $(common_src_files))
i18n_src_files := $(addprefix $(src_dir)/i18n/, $(i18n_src_files))

NDK_TOOLCHAIN_VERSION := clang
LOCAL_CFLAGS := -DU_COMMON_IMPLEMENTATION -DU_I18N_IMPLEMENTATION -DU_COMBINED_IMPLEMENTATION
LOCAL_CPPFLAGS := -frtti
LOCAL_C_INCLUDES := $(src_dir)/i18n $(src_dir)/common \
  $(ANDROID_NDK)/sources/cxx-stl/llvm-libc++/libcxx/include
#  $(ANDROID_NDK)/arch-arm/usr/include
LOCAL_MODULE := icu4c
LOCAL_SRC_FILES := $(common_src_files) $(i18n_src_files)
LOCAL_LDLIBS += -L$(ANDROID_NDK)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI)
#LOCAL_SHARED_LIBRARIES = c c++_shared

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
