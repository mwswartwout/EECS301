// megafunction wizard: %FIR Compiler II v13.1%
// GENERATION: XML
// lowPass.v

// Generated using ACDS version 13.1 162 at 2014.05.07.12:36:10

`timescale 1 ps / 1 ps
module lowPass (
		input  wire        clk,              //                     clk.clk
		input  wire        reset_n,          //                     rst.reset_n
		input  wire [11:0] ast_sink_data,    //   avalon_streaming_sink.data
		input  wire        ast_sink_valid,   //                        .valid
		input  wire [1:0]  ast_sink_error,   //                        .error
		output wire [11:0] ast_source_data,  // avalon_streaming_source.data
		output wire        ast_source_valid, //                        .valid
		output wire [1:0]  ast_source_error  //                        .error
	);

	lowPass_0002 lowpass_inst (
		.clk              (clk),              //                     clk.clk
		.reset_n          (reset_n),          //                     rst.reset_n
		.ast_sink_data    (ast_sink_data),    //   avalon_streaming_sink.data
		.ast_sink_valid   (ast_sink_valid),   //                        .valid
		.ast_sink_error   (ast_sink_error),   //                        .error
		.ast_source_data  (ast_source_data),  // avalon_streaming_source.data
		.ast_source_valid (ast_source_valid), //                        .valid
		.ast_source_error (ast_source_error)  //                        .error
	);

endmodule
// Retrieval info: <?xml version="1.0"?>
//<!--
//	Generated by Altera MegaWizard Launcher Utility version 1.0
//	************************************************************
//	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//	************************************************************
//	Copyright (C) 1991-2014 Altera Corporation
//	Any megafunction design, and related net list (encrypted or decrypted),
//	support information, device programming or simulation file, and any other
//	associated documentation or information provided by Altera or a partner
//	under Altera's Megafunction Partnership Program may be used only to
//	program PLD devices (but not masked PLD devices) from Altera.  Any other
//	use of such megafunction design, net list, support information, device
//	programming or simulation file, or any other related documentation or
//	information is prohibited for any other purpose, including, but not
//	limited to modification, reverse engineering, de-compiling, or use with
//	any other silicon devices, unless such use is explicitly licensed under
//	a separate agreement with Altera or a megafunction partner.  Title to
//	the intellectual property, including patents, copyrights, trademarks,
//	trade secrets, or maskworks, embodied in any such megafunction design,
//	net list, support information, device programming or simulation file, or
//	any other related documentation or information provided by Altera or a
//	megafunction partner, remains with Altera, the megafunction partner, or
//	their respective licensors.  No other licenses, including any licenses
//	needed under any third party's intellectual property, are provided herein.
//-->
// Retrieval info: <instance entity-name="altera_fir_compiler_ii" version="13.1" >
// Retrieval info: 	<generic name="deviceFamily" value="Cyclone III" />
// Retrieval info: 	<generic name="filterType" value="Single Rate" />
// Retrieval info: 	<generic name="interpFactor" value="1" />
// Retrieval info: 	<generic name="decimFactor" value="1" />
// Retrieval info: 	<generic name="L_bandsFilter" value="All taps" />
// Retrieval info: 	<generic name="clockRate" value="16" />
// Retrieval info: 	<generic name="clockSlack" value="0" />
// Retrieval info: 	<generic name="speedGrade" value="Medium" />
// Retrieval info: 	<generic name="coeffReload" value="false" />
// Retrieval info: 	<generic name="baseAddress" value="0" />
// Retrieval info: 	<generic name="readWriteMode" value="Read/Write" />
// Retrieval info: 	<generic name="backPressure" value="false" />
// Retrieval info: 	<generic name="symmetryMode" value="Non Symmetry" />
// Retrieval info: 	<generic name="delayRAMBlockThreshold" value="20" />
// Retrieval info: 	<generic name="dualMemDistRAMThreshold" value="1280" />
// Retrieval info: 	<generic name="mRAMThreshold" value="1000000" />
// Retrieval info: 	<generic name="hardMultiplierThreshold" value="-1" />
// Retrieval info: 	<generic name="inputRate" value=".05" />
// Retrieval info: 	<generic name="inputChannelNum" value="1" />
// Retrieval info: 	<generic name="inputType" value="Signed Binary" />
// Retrieval info: 	<generic name="inputBitWidth" value="12" />
// Retrieval info: 	<generic name="inputFracBitWidth" value="0" />
// Retrieval info: 	<generic name="coeffSetRealValue" value="-0.0029944504774001967,-5.610168175171048E-4,-6.106655850907794E-4,-6.6116252685701E-4,-7.122485409445989E-4,-7.637949949503071E-4,-8.152785149928121E-4,-8.666783529604022E-4,-9.174759457065263E-4,-9.674356843710482E-4,-0.0010163166317556439,-0.0010635519763624547,-0.0011088609593096147,-0.001151859929336281,-0.0011921539128871568,-0.0012293122855277082,-0.001262771608073789,-0.0012922384153777,-0.0013173014044408626,-0.0013374765250266725,-0.0013522931028295973,-0.0013612022368343622,-0.0013639805117523073,-0.0013599483214112977,-0.001348522844208826,-0.0013297494208337267,-0.0013026840553401013,-0.001267308372378601,-0.0012230254450325679,-0.0011690993788971993,-0.0011064348438558956,-0.0010316859487848609,-9.483085668867393E-4,-8.535044081396131E-4,-7.46776953278908E-4,-6.288887471142425E-4,-4.996096884022728E-4,-3.5840088777713646E-4,-2.0456044783489615E-4,-3.801840673965066E-5,1.4100437505105339E-4,3.325253682735947E-4,5.365275361655741E-4,7.532668769464539E-4,9.829327510239442E-4,0.0012254689194159238,0.0014807179835745208,0.0017482459349396782,0.002027952244622428,0.0023198908639370033,0.0026238248548831533,0.0029394034644096905,0.0032660499587760603,0.003603965903614719,0.003952849541672188,0.004310980143660092,0.004679345686540102,0.005056193830376547,0.005441449387955273,0.0058344345814689644,0.00623419947720828,0.006640720208718439,0.0070524225112834835,0.007469266062358762,0.007890376001556574,0.008314641903232809,0.00874154426990267,0.009170220205569228,0.009599717004548647,0.010028914954949671,0.01045678537320309,0.010882505771642072,0.01130501610654959,0.011723404732717718,0.012136856611455792,0.012544643452131023,0.01294612527218056,0.013340167239830175,0.013725540884199668,0.014100814659865176,0.014464519809832401,0.014816323452798208,0.015156560915788812,0.015485987879932495,0.015802108074738988,0.016095887976702004,0.01638260061685178,0.01664901813373988,0.016899452429022233,0.017132350235106328,0.017346968932575715,0.01754304470687904,0.017719672397252556,0.017876710821841377,0.018013636910568214,0.018129952950104403,0.018225615313545676,0.018300305626010843,0.018353825153385222,0.01838598548043724,0.018396675828781635,0.01838598548043724,0.018353825153385222,0.018300305626010843,0.018225615313545676,0.018129952950104403,0.018013636910568214,0.017876710821841377,0.017719672397252556,0.01754304470687904,0.017346968932575715,0.017132350235106328,0.016899452429022233,0.01664901813373988,0.01638260061685178,0.016095887976702004,0.015802108074738988,0.015485987879932495,0.015156560915788812,0.014816323452798208,0.014464519809832401,0.014100814659865176,0.013725540884199668,0.013340167239830175,0.01294612527218056,0.012544643452131023,0.012136856611455792,0.011723404732717718,0.01130501610654959,0.010882505771642072,0.01045678537320309,0.010028914954949671,0.009599717004548647,0.009170220205569228,0.00874154426990267,0.008314641903232809,0.007890376001556574,0.007469266062358762,0.0070524225112834835,0.006640720208718439,0.00623419947720828,0.0058344345814689644,0.005441449387955273,0.005056193830376547,0.004679345686540102,0.004310980143660092,0.003952849541672188,0.003603965903614719,0.0032660499587760603,0.0029394034644096905,0.0026238248548831533,0.0023198908639370033,0.002027952244622428,0.0017482459349396782,0.0014807179835745208,0.0012254689194159238,9.829327510239442E-4,7.532668769464539E-4,5.365275361655741E-4,3.325253682735947E-4,1.4100437505105339E-4,-3.801840673965066E-5,-2.0456044783489615E-4,-3.5840088777713646E-4,-4.996096884022728E-4,-6.288887471142425E-4,-7.46776953278908E-4,-8.535044081396131E-4,-9.483085668867393E-4,-0.0010316859487848609,-0.0011064348438558956,-0.0011690993788971993,-0.0012230254450325679,-0.001267308372378601,-0.0013026840553401013,-0.0013297494208337267,-0.001348522844208826,-0.0013599483214112977,-0.0013639805117523073,-0.0013612022368343622,-0.0013522931028295973,-0.0013374765250266725,-0.0013173014044408626,-0.0012922384153777,-0.001262771608073789,-0.0012293122855277082,-0.0011921539128871568,-0.001151859929336281,-0.0011088609593096147,-0.0010635519763624547,-0.0010163166317556439,-9.674356843710482E-4,-9.174759457065263E-4,-8.666783529604022E-4,-8.152785149928121E-4,-7.637949949503071E-4,-7.122485409445989E-4,-6.6116252685701E-4,-6.106655850907794E-4,-5.610168175171048E-4,-0.00299445" />
// Retrieval info: 	<generic name="coeffType" value="Signed Binary" />
// Retrieval info: 	<generic name="coeffScaling" value="Auto" />
// Retrieval info: 	<generic name="coeffBitWidth" value="12" />
// Retrieval info: 	<generic name="coeffFracBitWidth" value="0" />
// Retrieval info: 	<generic name="outType" value="Signed Binary" />
// Retrieval info: 	<generic name="outMSBRound" value="Saturating" />
// Retrieval info: 	<generic name="outMsbBitRem" value="5" />
// Retrieval info: 	<generic name="outLSBRound" value="Truncation" />
// Retrieval info: 	<generic name="outLsbBitRem" value="15" />
// Retrieval info: 	<generic name="resoureEstimation" value="1000,1200,10" />
// Retrieval info: 	<generic name="bankCount" value="1" />
// Retrieval info: 	<generic name="bankDisplay" value="0" />
// Retrieval info: </instance>
// IPFS_FILES : lowPass.vo
// RELATED_FILES: lowPass.v, altera_avalon_sc_fifo.v, auk_dspip_math_pkg_hpfir.vhd, auk_dspip_lib_pkg_hpfir.vhd, auk_dspip_avalon_streaming_controller_hpfir.vhd, auk_dspip_avalon_streaming_sink_hpfir.vhd, auk_dspip_avalon_streaming_source_hpfir.vhd, auk_dspip_roundsat_hpfir.vhd, dspba_library_package.vhd, dspba_library.vhd, lowPass_0002_rtl.vhd, lowPass_0002_ast.vhd, lowPass_0002.vhd
