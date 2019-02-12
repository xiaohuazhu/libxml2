LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

common_src_files = \
appendable.cpp			loclikely.cpp			servls.cpp			ucnv_ct.cpp			uloc.cpp			usetiter.cpp \
bmpset.cpp			locmap.cpp			servnotf.cpp			ucnv_err.cpp			uloc_keytype.cpp		ushape.cpp \
brkeng.cpp			locresdata.cpp			servrbf.cpp			ucnv_ext.cpp			uloc_tag.cpp			usprep.cpp \
brkiter.cpp			locutil.cpp			servslkf.cpp			ucnv_io.cpp			umapfile.cpp			ustack.cpp \
bytesinkutil.cpp		messagepattern.cpp		sharedobject.cpp		ucnv_lmb.cpp			umath.cpp			ustr_cnv.cpp \
bytestream.cpp			normalizer2.cpp			simpleformatter.cpp		ucnv_set.cpp			umutex.cpp			ustr_titlecase_brkiter.cpp \
bytestrie.cpp			normalizer2impl.cpp		static_unicode_sets.cpp		ucnv_u16.cpp			unames.cpp			ustr_wcs.cpp \
bytestriebuilder.cpp		normlzr.cpp			stringpiece.cpp			ucnv_u32.cpp			unifiedcache.cpp		ustrcase.cpp \
bytestrieiterator.cpp		parsepos.cpp			stringtriebuilder.cpp		ucnv_u7.cpp			unifilt.cpp			ustrcase_locale.cpp \
caniter.cpp			patternprops.cpp		uarrsort.cpp			ucnv_u8.cpp			unifunct.cpp			ustrenum.cpp \
chariter.cpp			pluralmap.cpp			ubidi.cpp			ucnvbocu.cpp			uniset.cpp			ustrfmt.cpp \
charstr.cpp			propname.cpp			ubidi_props.cpp			ucnvdisp.cpp			uniset_closure.cpp		ustring.cpp \
cmemory.cpp			propsvec.cpp			ubidiln.cpp			ucnvhz.cpp			uniset_props.cpp		ustrtrns.cpp \
cstr.cpp			punycode.cpp			ubiditransform.cpp		ucnvisci.cpp			unisetspan.cpp			utext.cpp \
cstring.cpp			putil.cpp			ubidiwrt.cpp			ucnvlat1.cpp			unistr.cpp			utf_impl.cpp \
cwchar.cpp			rbbi.cpp			ubrk.cpp			ucnvmbcs.cpp			unistr_case.cpp			util.cpp \
dictbe.cpp			rbbi_cache.cpp			ucase.cpp			ucnvscsu.cpp			unistr_case_locale.cpp		util_props.cpp \
dictionarydata.cpp		rbbidata.cpp			ucasemap.cpp			ucnvsel.cpp			unistr_cnv.cpp			utrace.cpp \
dtintrv.cpp			rbbinode.cpp			ucasemap_titlecase_brkiter.cpp	ucol_swp.cpp			unistr_props.cpp		utrie.cpp \
edits.cpp			rbbirb.cpp			ucat.cpp			ucurr.cpp			unistr_titlecase_brkiter.cpp	utrie2.cpp \
errorcode.cpp			rbbiscan.cpp			uchar.cpp			udata.cpp			unorm.cpp			utrie2_builder.cpp \
filteredbrk.cpp			rbbisetb.cpp			ucharstrie.cpp			udatamem.cpp			unormcmp.cpp			uts46.cpp \
filterednormalizer2.cpp		rbbistbl.cpp			ucharstriebuilder.cpp		udataswp.cpp			uobject.cpp			utypes.cpp \
icudataver.cpp			rbbitblb.cpp			ucharstrieiterator.cpp		uenum.cpp			uprops.cpp			uvector.cpp \
icuplug.cpp			resbund.cpp			uchriter.cpp			uhash.cpp			ures_cnv.cpp			uvectr32.cpp \
listformatter.cpp		resbund_cnv.cpp			ucln_cmn.cpp			uhash_us.cpp			uresbund.cpp			uvectr64.cpp \
loadednormalizer2impl.cpp	resource.cpp			ucmndata.cpp			uidna.cpp			uresdata.cpp			wintz.cpp \
locavailable.cpp		ruleiter.cpp			ucnv.cpp			uinit.cpp			usc_impl.cpp \
locbased.cpp			schriter.cpp			ucnv2022.cpp			uinvchar.cpp			uscript.cpp \
locdispnames.cpp		serv.cpp			ucnv_bld.cpp			uiter.cpp			uscript_props.cpp \
locdspnm.cpp			servlk.cpp			ucnv_cb.cpp			ulist.cpp			uset.cpp \
locid.cpp			servlkf.cpp			ucnv_cnv.cpp			ulistformatter.cpp		uset_props.cpp

common_src_files += ../stubdata/stubdata.cpp

i18n_src_files = \
alphaindex.cpp				currfmt.cpp				nfsubs.cpp				quantityformatter.cpp			tznames.cpp \
anytrans.cpp				currpinf.cpp				nortrans.cpp				rbnf.cpp				tznames_impl.cpp \
astro.cpp				currunit.cpp				nounit.cpp				rbt.cpp					tzrule.cpp \
basictz.cpp				dangical.cpp				nultrans.cpp				rbt_data.cpp				tztrans.cpp \
bocsu.cpp				datefmt.cpp				number_affixutils.cpp			rbt_pars.cpp				ucal.cpp \
brktrans.cpp				dayperiodrules.cpp			number_asformat.cpp			rbt_rule.cpp				ucln_in.cpp \
buddhcal.cpp				dcfmtsym.cpp				number_capi.cpp				rbt_set.cpp				ucol.cpp \
calendar.cpp				decContext.cpp				number_compact.cpp			rbtz.cpp				ucol_res.cpp \
casetrn.cpp				decNumber.cpp				number_currencysymbols.cpp		regexcmp.cpp				ucol_sit.cpp \
cecal.cpp				decimfmt.cpp				number_decimalquantity.cpp		regeximp.cpp				ucoleitr.cpp \
chnsecal.cpp				double-conversion-bignum-dtoa.cpp	number_decimfmtprops.cpp		regexst.cpp				ucsdet.cpp \
choicfmt.cpp				double-conversion-bignum.cpp		number_fluent.cpp			regextxt.cpp				udat.cpp \
coleitr.cpp				double-conversion-cached-powers.cpp	number_formatimpl.cpp			region.cpp				udateintervalformat.cpp \
coll.cpp				double-conversion-diy-fp.cpp		number_grouping.cpp			reldatefmt.cpp				udatpg.cpp \
collation.cpp				double-conversion-fast-dtoa.cpp		number_integerwidth.cpp			reldtfmt.cpp				ufieldpositer.cpp \
collationbuilder.cpp			double-conversion-strtod.cpp		number_longnames.cpp			rematch.cpp				uitercollationiterator.cpp \
collationcompare.cpp			double-conversion.cpp			number_mapper.cpp			remtrans.cpp				ulocdata.cpp \
collationdata.cpp			dtfmtsym.cpp				number_modifiers.cpp			repattrn.cpp				umsg.cpp \
collationdatabuilder.cpp		dtitvfmt.cpp				number_multiplier.cpp			rulebasedcollator.cpp			unesctrn.cpp \
collationdatareader.cpp			dtitvinf.cpp				number_notation.cpp			scientificnumberformatter.cpp		uni2name.cpp \
collationdatawriter.cpp			dtptngen.cpp				number_padding.cpp			scriptset.cpp				unum.cpp \
collationfastlatin.cpp			dtrule.cpp				number_patternmodifier.cpp		search.cpp				unumsys.cpp \
collationfastlatinbuilder.cpp		esctrn.cpp				number_patternstring.cpp		selfmt.cpp				upluralrules.cpp \
collationfcd.cpp			ethpccal.cpp				number_rounding.cpp			sharedbreakiterator.cpp			uregex.cpp \
collationiterator.cpp			fmtable.cpp				number_scientific.cpp			simpletz.cpp				uregexc.cpp \
collationkeys.cpp			fmtable_cnv.cpp				number_skeletons.cpp			smpdtfmt.cpp				uregion.cpp \
collationroot.cpp			format.cpp				number_stringbuilder.cpp		smpdtfst.cpp				usearch.cpp \
collationrootelements.cpp		fphdlimp.cpp				number_utils.cpp			sortkey.cpp				uspoof.cpp \
collationruleparser.cpp			fpositer.cpp				numfmt.cpp				standardplural.cpp			uspoof_build.cpp \
collationsets.cpp			funcrepl.cpp				numparse_affixes.cpp			strmatch.cpp				uspoof_conf.cpp \
collationsettings.cpp			gender.cpp				numparse_compositions.cpp		strrepl.cpp				uspoof_impl.cpp \
collationtailoring.cpp			gregocal.cpp				numparse_currency.cpp			stsearch.cpp				utf16collationiterator.cpp \
collationweights.cpp			gregoimp.cpp				numparse_decimal.cpp			taiwncal.cpp				utf8collationiterator.cpp \
compactdecimalformat.cpp		hebrwcal.cpp				numparse_impl.cpp			timezone.cpp				utmscale.cpp \
coptccal.cpp				indiancal.cpp				numparse_parsednumber.cpp		titletrn.cpp				utrans.cpp \
cpdtrans.cpp				inputext.cpp				numparse_scientific.cpp			tmunit.cpp				vtzone.cpp \
csdetect.cpp				islamcal.cpp				numparse_stringsegment.cpp		tmutamt.cpp				vzone.cpp \
csmatch.cpp				japancal.cpp				numparse_symbols.cpp			tmutfmt.cpp				windtfmt.cpp \
csr2022.cpp				measfmt.cpp				numparse_validators.cpp			tolowtrn.cpp				winnmfmt.cpp \
csrecog.cpp				measunit.cpp				numsys.cpp				toupptrn.cpp				wintzimpl.cpp \
csrmbcs.cpp				measure.cpp				olsontz.cpp				translit.cpp				zonemeta.cpp \
csrsbcs.cpp				msgfmt.cpp				persncal.cpp				transreg.cpp				zrule.cpp \
csrucode.cpp				name2uni.cpp				plurfmt.cpp				tridpars.cpp				ztrans.cpp \
csrutf8.cpp				nfrs.cpp				plurrule.cpp				tzfmt.cpp \
curramt.cpp				nfrule.cpp				quant.cpp				tzgnames.cpp

src_dir := $(LOCAL_PATH)/../../source
common_src_files := $(addprefix $(src_dir)/common/, $(common_src_files))
i18n_src_files := $(addprefix $(src_dir)/i18n/, $(i18n_src_files))

NDK_TOOLCHAIN_VERSION := clang
LOCAL_CFLAGS := -DU_COMMON_IMPLEMENTATION -DU_I18N_IMPLEMENTATION -DU_COMBINED_IMPLEMENTATION -fPIC -O3 -Wall
LOCAL_CPPFLAGS := -frtti -std=c++1z
LOCAL_C_INCLUDES := $(src_dir)/i18n $(src_dir)/common
LOCAL_MODULE := icu4c
LOCAL_SRC_FILES := $(common_src_files) $(i18n_src_files)
# LOCAL_LDLIBS += -L$(ANDROID_NDK)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI)
#LOCAL_SHARED_LIBRARIES = c c++_shared

#include $(BUILD_SHARED_LIBRARY)
include $(BUILD_STATIC_LIBRARY)
