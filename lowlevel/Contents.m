% Seismology Toolbox - lowlevel
% Version 0.6.0-r170 Gunnbjørnfjeld 11-Oct-2010
%
% Low-level internal functions
%CHECKHEADER_STATE     - Check/Change if CHECKHEADER is ON=TRUE / OFF=FALSE
%CHECKPARAMETERS       - Parses options passed to CHECKHEADER
%CUTPARAMETERS         - Parses inputs defining the data window(s)
%GETFILEVERSION        - Get filetype, version and byte-order of SEIZMO datafile
%ISSEIZMO              - True for SEIZMO data structures
%ISVALIDSEIZMO         - TRUE for valid filetype/version combinations
%SEIZMOCHECK           - Validate SEIZMO data structure
%SEIZMOCHECK_STATE     - Check/Change if SEIZMOCHECK is ON=TRUE / OFF=FALSE
%SEIZMODEBUG           - Turn SEIZMO debugging output on (TRUE) or off (FALSE)
%SEIZMODEF             - Returns specified SEIZMO definition structure
%SEIZMOSIZE            - Returns header-estimated disksize of SEIZMO records in bytes
%VALIDSEIZMO           - Returns valid SEIZMO datafile filetypes or versions
%VERSIONINFO           - Returns version info for SEIZMO data records
%VERSIONINFO_CACHE     - Check/Change VERSIONINFO caching ON=TRUE / OFF=FALSE
%WRITEPARAMETERS       - Implements options passed to WRITE functions