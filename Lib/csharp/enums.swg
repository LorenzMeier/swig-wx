/* -----------------------------------------------------------------------------
 * See the LICENSE file for information on copyright, usage and redistribution
 * of SWIG, and the README file for authors - http://www.swig.org/release.html.
 *
 * enums.swg
 *
 * Include this file in order for C/C++ enums to be wrapped by proper C# enums.
 * Note that the PINVOKE layer handles the enum as an int.
 * ----------------------------------------------------------------------------- */

// const enum SWIGTYPE & typemaps
%typemap(ctype) const enum SWIGTYPE & "int"
%typemap(imtype) const enum SWIGTYPE & "int"
%typemap(cstype) const enum SWIGTYPE & "$*csclassname"

%typemap(in) const enum SWIGTYPE & ($*1_ltype temp)
%{ temp = ($*1_ltype)$input; 
   $1 = &temp; %}
%typemap(out) const enum SWIGTYPE & %{ $result = *$1; %}

%typecheck(SWIG_TYPECHECK_POINTER) const enum SWIGTYPE & ""

%typemap(throws, canthrow=1) const enum SWIGTYPE &
%{ (void)$1;
   SWIG_CSharpSetPendingException(SWIG_CSharpApplicationException, "C++ $1_type exception thrown");
   return $null; %}

%typemap(csin) const enum SWIGTYPE & "(int)$csinput"
%typemap(csout, excode=SWIGEXCODE) const enum SWIGTYPE & {
    $*csclassname ret = ($*csclassname)$imcall;$excode
    return ret;
  }

%typemap(csvarout, excode=SWIGEXCODE2) const enum SWIGTYPE & %{
    get {
      $*csclassname ret = ($*csclassname)$imcall;$excode
      return ret;
    } %}


// enum SWIGTYPE typemaps
%typemap(ctype) enum SWIGTYPE "int"
%typemap(imtype) enum SWIGTYPE "int"
%typemap(cstype) enum SWIGTYPE "$csclassname"

%typemap(in) enum SWIGTYPE %{ $1 = ($1_ltype)$input; %}
%typemap(out) enum SWIGTYPE %{ $result = $1; %}

%typecheck(SWIG_TYPECHECK_POINTER) enum SWIGTYPE ""

%typemap(throws, canthrow=1) enum SWIGTYPE
%{ (void)$1;
   SWIG_CSharpSetPendingException(SWIG_CSharpApplicationException, "C++ $1_type exception thrown");
   return $null; %}

%typemap(csin) enum SWIGTYPE "(int)$csinput"
%typemap(csout, excode=SWIGEXCODE) enum SWIGTYPE {
    $csclassname ret = ($csclassname)$imcall;$excode
    return ret;
  }

%typemap(csvarout, excode=SWIGEXCODE2) enum SWIGTYPE %{
    get {
      $csclassname ret = ($csclassname)$imcall;$excode
      return ret;
    } %}

%typemap(csbase)           enum SWIGTYPE ""
%typemap(csclassmodifiers) enum SWIGTYPE "public enum"
%typemap(cscode)           enum SWIGTYPE ""
%typemap(csimports)        enum SWIGTYPE ""
%typemap(csinterfaces)     enum SWIGTYPE ""

%typemap(csbody) enum SWIGTYPE ""

%csenum(proper);

