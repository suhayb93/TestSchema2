CREATE OR REPLACE NONEDITIONABLE PACKAGE mdsys.sdo_lrs AUTHID current_user AS

--
--
-- functions/procedure for defining, creating and manipulating LRS geometric segments
--
--

   --
   -- define an LRS geometric segment, all measures will be automatically populated
   --

   PROCEDURE define_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                 dim_array     IN mdsys.SDO_DIM_ARRAY,
                                 start_measure IN NUMBER ,
                                 end_measure   IN NUMBER );


   PROCEDURE define_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                 dim_array     IN mdsys.SDO_DIM_ARRAY);




   PROCEDURE define_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                 start_measure IN NUMBER ,
                                 end_measure   IN NUMBER ,
                                 tolerance     IN NUMBER DEFAULT 1.0e-8);



   PROCEDURE define_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                 tolerance     IN NUMBER DEFAULT 1.0e-8);




   PROCEDURE define_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                    dim_array     IN mdsys.SDO_DIM_ARRAY,
                                    start_measure IN NUMBER ,
                                    end_measure   IN NUMBER );

   PROCEDURE define_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                    dim_array     IN mdsys.SDO_DIM_ARRAY);


   PROCEDURE define_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                    start_measure IN NUMBER ,
                                    end_measure   IN NUMBER ,
                                    tolerance     IN NUMBER DEFAULT 1.0e-8);

   PROCEDURE define_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                    tolerance     IN NUMBER DEFAULT 1.0e-8);






   --
   -- create a new geometric segment by clipping the given geometric segment
   --

   FUNCTION clip_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                              dim_array     IN mdsys.SDO_DIM_ARRAY,
                              start_measure IN NUMBER,
                              end_measure   IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION clip_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                              start_measure IN NUMBER,
                              end_measure   IN NUMBER,
                              tolerance     IN NUMBER DEFAULT 1.0e-8)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION clip_geom_segment_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                 dim_array     IN mdsys.SDO_DIM_ARRAY,
                                 start_measure IN NUMBER,
                                 end_measure   IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION clip_geom_segment_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                 start_measure IN NUMBER,
                                 end_measure   IN NUMBER,
                                 tolerance     IN NUMBER DEFAULT 1.0e-8)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   --
   -- split a geometric segment into two
   --


   PROCEDURE split_geom_segment(geom_segment  IN  mdsys.SDO_GEOMETRY,
                                dim_array     IN  mdsys.SDO_DIM_ARRAY,
                                split_measure IN  NUMBER,
                                segment_1     OUT mdsys.SDO_GEOMETRY,
                                segment_2     OUT mdsys.SDO_GEOMETRY);


   PROCEDURE split_geom_segment(geom_segment  IN  mdsys.SDO_GEOMETRY,
                                split_measure IN  NUMBER,
                                segment_1     OUT mdsys.SDO_GEOMETRY,
                                segment_2     OUT mdsys.SDO_GEOMETRY,
                                tolerance     IN  NUMBER DEFAULT 1.0e-8);



   PROCEDURE split_geom_segment_3d(geom_segment  IN  mdsys.SDO_GEOMETRY,
                                   dim_array     IN  mdsys.SDO_DIM_ARRAY,
                                   split_measure IN  NUMBER,
                                   segment_1     OUT mdsys.SDO_GEOMETRY,
                                   segment_2     OUT mdsys.SDO_GEOMETRY);


   PROCEDURE split_geom_segment_3d(geom_segment  IN  mdsys.SDO_GEOMETRY,
                                   split_measure IN  NUMBER,
                                   segment_1     OUT mdsys.SDO_GEOMETRY,
                                   segment_2     OUT mdsys.SDO_GEOMETRY,
                                   tolerance     IN  NUMBER DEFAULT 1.0e-8);



   --
   -- concatenate two geometric segments into one
   --

   FUNCTION concatenate_geom_segments(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                      dim_array_1    IN mdsys.SDO_DIM_ARRAY,
                                      geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                      dim_array_2    IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION concatenate_geom_segments(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                      geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                      tolerance      IN NUMBER DEFAULT 1.0e-8)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION concatenate_geom_segments_3d(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                         dim_array_1    IN mdsys.SDO_DIM_ARRAY,
                                         geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                         dim_array_2    IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION concatenate_geom_segments_3d(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                         geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                         tolerance      IN NUMBER DEFAULT 1.0e-8)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;





   --
   -- general segment scaling function
   --

   FUNCTION scale_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               start_measure IN NUMBER,
                               end_measure   IN NUMBER,
                               shift_measure IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION scale_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                               start_measure IN NUMBER,
                               end_measure   IN NUMBER,
                               shift_measure IN NUMBER,
                               tolerance     IN NUMBER DEFAULT 1.0e-8)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




--
--
-- LRS query functions/procedures
--
--

   --
   -- check if the given geometric segment is valid
   --

   FUNCTION valid_geom_segment(geom_segment IN mdsys.SDO_GEOMETRY,
                               dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_geom_segment(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION valid_geom_segment_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                  dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_geom_segment_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;




   --
   -- check if the measure information of a given geometric segment is defined
   -- the geom segment must be valid, (type, length, and no of dim, etc)
   --

   FUNCTION is_geom_segment_defined(geom_segment IN mdsys.SDO_GEOMETRY,
                                    dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_geom_segment_defined(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION is_geom_segment_defined_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                       dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;

   FUNCTION is_geom_segment_defined_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   --
   -- check if the given LRS point is valid
   --


   FUNCTION valid_lrs_pt(point      IN mdsys.SDO_GEOMETRY,
                         dim_array  IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_lrs_pt(point      IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION valid_lrs_pt_3d(point      IN mdsys.SDO_GEOMETRY,
                            dim_array  IN mdsys.SDO_DIM_ARRAY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_lrs_pt_3d(point      IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;




   --
   -- check if the given measure falls within the start/end measures
   -- of a given geometric segment
   --


   FUNCTION valid_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                          dim_array    IN mdsys.SDO_DIM_ARRAY,
                          measure      IN NUMBER)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                          measure      IN NUMBER)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION valid_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                             dim_array    IN mdsys.SDO_DIM_ARRAY,
                             measure      IN NUMBER)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION valid_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                             measure      IN NUMBER)
   RETURN VARCHAR2 PARALLEL_ENABLE;






   --
   -- check if two given geometric segments are connected
   --

   FUNCTION connected_geom_segments(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                    dim_array_1    IN mdsys.SDO_DIM_ARRAY,
                                    geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                    dim_array_2    IN mdsys.SDO_DIM_ARRAY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION connected_geom_segments(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                    geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                    tolerance      IN NUMBER)


   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION connected_geom_segments_3d(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                       dim_array_1    IN mdsys.SDO_DIM_ARRAY,
                                       geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                       dim_array_2    IN mdsys.SDO_DIM_ARRAY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION connected_geom_segments_3d(geom_segment_1 IN mdsys.SDO_GEOMETRY,
                                       geom_segment_2 IN mdsys.SDO_GEOMETRY,
                                       tolerance      IN NUMBER)
   RETURN VARCHAR2 PARALLEL_ENABLE;





   --
   -- return the length of the given geometric segment
   --

   FUNCTION geom_segment_length(geom_segment IN mdsys.SDO_GEOMETRY,
                                dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION geom_segment_length(geom_segment IN mdsys.SDO_GEOMETRY,
                                tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION geom_segment_length_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                   dim_array    IN mdsys.SDO_DIM_ARRAY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION geom_segment_length_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                   tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN NUMBER PARALLEL_ENABLE;




   --
   -- return the start point of the geometric segment
   --

   FUNCTION geom_segment_start_pt(geom_segment IN mdsys.SDO_GEOMETRY,
                                  dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION geom_segment_start_pt(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION geom_segment_start_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                     dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION geom_segment_start_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   --
   -- return the start measure of the geometric segment
   --


   FUNCTION geom_segment_start_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                                       dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION geom_segment_start_measure(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION geom_segment_start_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                          dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION geom_segment_start_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;



   --
   -- return the end point of the geometric segment
   --

   FUNCTION geom_segment_end_pt(geom_segment IN mdsys.SDO_GEOMETRY,
                                dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION geom_segment_end_pt(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION geom_segment_end_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                   dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION geom_segment_end_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   --
   -- return the end point of the geometric segment
   --

   FUNCTION geom_segment_end_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                                     dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION geom_segment_end_measure(geom_segment IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION geom_segment_end_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                        dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION geom_segment_end_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;





   --
   -- return the measure of a LSR point
   --

   FUNCTION get_measure(point     IN mdsys.SDO_GEOMETRY,
                        dim_array IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION get_measure(point     IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_measure_3d(point     IN mdsys.SDO_GEOMETRY,
                           dim_array IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_measure_3d(point     IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;



   --
   -- locate the point w.r.t a given geometric segment
   --

   FUNCTION locate_pt(geom_segment IN mdsys.SDO_GEOMETRY,
                      dim_array    IN mdsys.SDO_DIM_ARRAY,
                      measure      IN NUMBER,
                      offset       IN NUMBER DEFAULT 0)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION locate_pt(geom_segment IN mdsys.SDO_GEOMETRY,
                      measure      IN NUMBER,
                      offset       IN NUMBER default 0,
                      tolerance    IN NUMBER default 1.0e-8)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION locate_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                         dim_array    IN mdsys.SDO_DIM_ARRAY,
                         measure      IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;

   FUNCTION locate_pt_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                         measure      IN NUMBER,
                         tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;





   --
   -- return the projection point of a given point w.r.t. to a given geometric segment
   --

   FUNCTION project_pt(geom_segment    IN mdsys.SDO_GEOMETRY,
                       dim_array       IN mdsys.SDO_DIM_ARRAY,
                       point           IN mdsys.SDO_GEOMETRY,
                       point_dim_array IN mdsys.SDO_DIM_ARRAY )

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION project_pt(geom_segment    IN mdsys.SDO_GEOMETRY,
                       dim_array       IN mdsys.SDO_DIM_ARRAY,
                       point           IN mdsys.SDO_GEOMETRY)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION project_pt(geom_segment    IN  mdsys.SDO_GEOMETRY,
                       dim_array       IN  mdsys.SDO_DIM_ARRAY,
                       point           IN  mdsys.SDO_GEOMETRY,
                       point_dim_array IN  mdsys.SDO_DIM_ARRAY,
                       offset          OUT NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;





   FUNCTION project_pt(geom_segment    IN mdsys.SDO_GEOMETRY,
                       point           IN mdsys.SDO_GEOMETRY,
                       tolerance       IN NUMBER DEFAULT 1.0e-8)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION project_pt(geom_segment    IN  mdsys.SDO_GEOMETRY,
                       point           IN  mdsys.SDO_GEOMETRY,
                       tolerance       IN  NUMBER,
                       offset          OUT NUMBER )


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION project_pt_3d(geom_segment    IN mdsys.SDO_GEOMETRY,
                          dim_array       IN mdsys.SDO_DIM_ARRAY,
                          point           IN mdsys.SDO_GEOMETRY,
                          point_dim_array IN mdsys.SDO_DIM_ARRAY )

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION project_pt_3d(geom_segment    IN mdsys.SDO_GEOMETRY,
                          dim_array       IN mdsys.SDO_DIM_ARRAY,
                          point           IN mdsys.SDO_GEOMETRY)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION project_pt_3d(geom_segment    IN  mdsys.SDO_GEOMETRY,
                          dim_array       IN  mdsys.SDO_DIM_ARRAY,
                          point           IN  mdsys.SDO_GEOMETRY,
                          point_dim_array IN  mdsys.SDO_DIM_ARRAY,
                          offset          OUT NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION project_pt_3d(geom_segment    IN mdsys.SDO_GEOMETRY,
                          point           IN mdsys.SDO_GEOMETRY,
                          tolerance       IN NUMBER DEFAULT 1.0e-8)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION project_pt_3d(geom_segment    IN  mdsys.SDO_GEOMETRY,
                          point           IN  mdsys.SDO_GEOMETRY,
                          tolerance       IN  NUMBER,
                          offset          OUT NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;







---
--- LRS 817 features declaration
---



   --
   -- return geom segment measure range
   --

   FUNCTION measure_range(geom_segment IN mdsys.SDO_GEOMETRY,
                          dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION measure_range(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;




   FUNCTION measure_range_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                             dim_array    IN mdsys.SDO_DIM_ARRAY)
   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION measure_range_3d(geom_segment IN mdsys.SDO_GEOMETRY)
   RETURN NUMBER PARALLEL_ENABLE;






   --
   -- Convert standard dim info to lrs diminfo by adding an additional measure informaiotn
   --

   FUNCTION convert_to_lrs_dim_array(dim_array   IN mdsys.SDO_DIM_ARRAY,
                                     dim_name    IN VARCHAR2,
                                     dim_pos     IN INTEGER,
                                     lower_bound IN NUMBER DEFAULT NULL,
                                     upper_bound IN NUMBER DEFAULT NULL,
                                     tolerance   IN NUMBER DEFAULT NULL)

   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;



   --
   -- Convert standard dim info to lrs diminfo by adding an additional measure informaiotn
   --

   FUNCTION convert_to_lrs_dim_array(dim_array   IN mdsys.SDO_DIM_ARRAY,
                                     dim_name    IN VARCHAR2,
                                     lower_bound IN NUMBER DEFAULT NULL,
                                     upper_bound IN NUMBER DEFAULT NULL,
                                     tolerance   IN NUMBER DEFAULT NULL)

   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;



   FUNCTION convert_to_lrs_dim_array(dim_array   IN mdsys.SDO_DIM_ARRAY,
                                     lower_bound IN NUMBER DEFAULT NULL,
                                     upper_bound IN NUMBER DEFAULT NULL,
                                     tolerance   IN NUMBER DEFAULT NULL)

   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;





   FUNCTION convert_to_lrs_dim_array_3d(dim_array   IN mdsys.SDO_DIM_ARRAY,
                                        dim_name    IN VARCHAR2,
                                        lower_bound IN NUMBER DEFAULT NULL,
                                        upper_bound IN NUMBER DEFAULT NULL,
                                        tolerance   IN NUMBER DEFAULT NULL)

   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;




   FUNCTION convert_to_std_dim_array(dim_array   IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;


   FUNCTION convert_to_std_dim_array(dim_array   IN mdsys.SDO_DIM_ARRAY,
                                     m_pos       IN INTEGER)
   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;



   FUNCTION convert_to_std_dim_array_3d(dim_array   IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_DIM_ARRAY PARALLEL_ENABLE;





   --
   -- Convert standard linestring geometry to an LRS geom segment
   --

   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                m_pos         IN INTEGER,
                                start_measure IN NUMBER ,
                                end_measure   IN NUMBER )
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                m_pos         IN INTEGER DEFAULT NULL)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                start_measure IN NUMBER ,
                                end_measure   IN NUMBER )
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                m_pos         IN INTEGER,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY,
                                m_pos         IN INTEGER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION convert_to_lrs_geom(standard_geom IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION convert_to_lrs_geom_3d(standard_geom IN mdsys.SDO_GEOMETRY,
                                   dim_array     IN mdsys.SDO_DIM_ARRAY,
                                   start_measure IN NUMBER DEFAULT NULL,
                                   end_measure   IN NUMBER DEFAULT NULL)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_geom_3d(standard_geom IN mdsys.SDO_GEOMETRY,
                                   start_measure IN NUMBER DEFAULT NULL,
                                   end_measure   IN NUMBER DEFAULT NULL)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- Convert an LRS geometry to a standard linestring geometry
   --

   FUNCTION convert_to_std_geom(lrs_geom IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_std_geom(lrs_geom IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   FUNCTION convert_to_std_geom_3d(lrs_geom      IN mdsys.SDO_GEOMETRY,
                                   dim_array     IN mdsys.SDO_DIM_ARRAY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION convert_to_std_geom_3d(lrs_geom IN mdsys.SDO_GEOMETRY)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;





   --
   -- Update standard geometry layer to an LRS geometry layer, metadata is updated as well
   --

   FUNCTION convert_to_lrs_layer(table_name    IN VARCHAR2,
                                 column_name   IN VARCHAR2,
                                 lower_bound   IN NUMBER DEFAULT NULL,
                                 upper_bound   IN NUMBER DEFAULT NULL,
                                 tolerance     IN NUMBER DEFAULT NULL)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_layer(table_name    IN VARCHAR2,
                                 column_name   IN VARCHAR2,
                                 dim_name      IN VARCHAR2,
                                 dim_pos       IN INTEGER,
                                 lower_bound   IN NUMBER DEFAULT NULL,
                                 upper_bound   IN NUMBER DEFAULT NULL,
                                 tolerance     IN NUMBER DEFAULT NULL)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION convert_to_lrs_layer_3d(table_name    IN VARCHAR2,
                                    column_name   IN VARCHAR2,
                                    lower_bound   IN NUMBER DEFAULT NULL,
                                    upper_bound   IN NUMBER DEFAULT NULL,
                                    tolerance     IN NUMBER DEFAULT NULL)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION convert_to_lrs_layer_3d(table_name    IN VARCHAR2,
                                    column_name   IN VARCHAR2,
                                    dim_name      IN VARCHAR2,
                                    lower_bound   IN NUMBER DEFAULT NULL,
                                    upper_bound   IN NUMBER DEFAULT NULL,
                                    tolerance     IN NUMBER DEFAULT NULL)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   --
   -- Update standard geometry layer to an LRS geometry layer, metadata is updated as well
   --

   FUNCTION convert_to_std_layer(table_name    IN VARCHAR2,
                                 column_name   IN VARCHAR2)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION convert_to_std_layer_3d(table_name    IN VARCHAR2,
                                    column_name   IN VARCHAR2)
   RETURN VARCHAR2 PARALLEL_ENABLE;



   --
   -- LRS 817 feature
   -- return a new geom_segment by translateing the original geom_segment
   --

   FUNCTION translate_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                              dim_array    IN mdsys.SDO_DIM_ARRAY,
                              translate_m  IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION translate_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                              translate_m  IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION translate_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                 dim_array    IN mdsys.SDO_DIM_ARRAY,
                                 translate_m  IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION translate_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                                 translate_m  IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- LRS 817 feature
   -- return a new geom_segment by reversing the original geom segment
   --

   FUNCTION reverse_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                            dim_array    IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION reverse_measure(geom_segment IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION reverse_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                               dim_array    IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION reverse_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   --
   -- LRS 817 find the measure of the closest pt of a given pt w.r.t. an LRS segment
   -- first project the pt onto the LRS segment then get the measure of the projection pt
   --

   FUNCTION find_measure(geom_segment           IN mdsys.SDO_GEOMETRY,
                         dim_array              IN mdsys.SDO_DIM_ARRAY,
                         point                  IN mdsys.SDO_GEOMETRY,
                         point_dim_array        IN mdsys.SDO_DIM_ARRAY DEFAULT NULL)

   RETURN NUMBER PARALLEL_ENABLE;




   FUNCTION find_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                         point        IN mdsys.SDO_GEOMETRY,
                         tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION find_measure_3d(geom_segment        IN mdsys.SDO_GEOMETRY,
                            dim_array           IN mdsys.SDO_DIM_ARRAY,
                            point               IN mdsys.SDO_GEOMETRY,
                            point_dim_array     IN mdsys.SDO_DIM_ARRAY DEFAULT NULL)

   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION find_measure_3d(geom_segment IN mdsys.SDO_GEOMETRY,
                            point        IN mdsys.SDO_GEOMETRY,
                            tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN NUMBER PARALLEL_ENABLE;

   FUNCTION find_offset(geom_segment            IN mdsys.SDO_GEOMETRY,
                        dim_array               IN mdsys.SDO_DIM_ARRAY,
                        point                   IN mdsys.SDO_GEOMETRY,
                        point_dim_array         IN mdsys.SDO_DIM_ARRAY DEFAULT NULL)

   RETURN NUMBER PARALLEL_ENABLE;




   FUNCTION find_offset(geom_segment IN mdsys.SDO_GEOMETRY,
                        point        IN mdsys.SDO_GEOMETRY,
                        tolerance    IN NUMBER DEFAULT 1.0e-8)

   RETURN NUMBER PARALLEL_ENABLE;





   --
   -- LRS 817 dynamic segmentation, an alias of clip_geom_segment
   --


   FUNCTION dynamic_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                            dim_array     IN mdsys.SDO_DIM_ARRAY,
                            start_measure IN NUMBER,
                            end_measure   IN NUMBER )

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION dynamic_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                            start_measure IN NUMBER,
                            end_measure   IN NUMBER,
                            tolerance     IN NUMBER DEFAULT 1.0e-8)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION dynamic_segment_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               start_measure IN NUMBER,
                               end_measure   IN NUMBER )

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION dynamic_segment_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                               start_measure IN NUMBER,
                               end_measure   IN NUMBER,
                               tolerance     IN NUMBER DEFAULT 1.0e-8)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- LRS 817 convert a measure to a percentage (0%~100%) w.r.t. a given geom segment
   --


   FUNCTION measure_to_percentage(geom_segment IN mdsys.SDO_GEOMETRY,
                                  dim_array    IN mdsys.SDO_DIM_ARRAY,
                                  measure      IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION measure_to_percentage(geom_segment IN mdsys.SDO_GEOMETRY,
                                  measure      IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;




   --
   -- LRS 817 convert a percentage (0%~100%) to a measure w.r.t. given geom segment
   --

   FUNCTION percentage_to_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                                  dim_array    IN mdsys.SDO_DIM_ARRAY,
                                  percentage   IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION percentage_to_measure(geom_segment IN mdsys.SDO_GEOMETRY,
                                  percentage   IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;



   --
   -- reset the measure values to NULL
   --
   PROCEDURE reset_measure(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                           dim_array     IN mdsys.SDO_DIM_ARRAY);


   PROCEDURE reset_measure(geom_segment  IN OUT mdsys.SDO_GEOMETRY);



   --
   -- Redefine the LRS segment (ignore all current measures) and repopulate measure info. based on
   -- the given start/end measure, this is different from define_geom_segment which keeps old measure info
   -- if exist.
   --

   PROCEDURE redefine_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                   dim_array     IN mdsys.SDO_DIM_ARRAY,
                                   start_measure IN NUMBER ,
                                   end_measure   IN NUMBER );


   PROCEDURE redefine_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                   dim_array     IN mdsys.SDO_DIM_ARRAY);




   PROCEDURE redefine_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                   start_measure IN NUMBER ,
                                   end_measure   IN NUMBER ,
                                   tolerance     IN NUMBER DEFAULT 1.0e-8);



   PROCEDURE redefine_geom_segment(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                   tolerance     IN NUMBER DEFAULT 1.0e-8);




   PROCEDURE redefine_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                      dim_array     IN mdsys.SDO_DIM_ARRAY,
                                      start_measure IN NUMBER ,
                                      end_measure   IN NUMBER );


   PROCEDURE redefine_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                      dim_array     IN mdsys.SDO_DIM_ARRAY);



   PROCEDURE redefine_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                      start_measure IN NUMBER ,
                                      end_measure   IN NUMBER ,
                                      tolerance     IN NUMBER DEFAULT 1.0e-8);


   PROCEDURE redefine_geom_segment_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                                      tolerance     IN NUMBER DEFAULT 1.0e-8);





---
--- 82 LRS Features
---


   --
   -- set the measure value of the closest point (using snap_to_pt) in the given geometry
   --

   FUNCTION set_pt_measure(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                           dim_array     IN mdsys.SDO_DIM_ARRAY,
                           point         IN mdsys.SDO_GEOMETRY,
                           pt_dim_array  IN mdsys.SDO_DIM_ARRAY,
                           measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION  set_pt_measure(point         IN OUT mdsys.SDO_GEOMETRY,
                            dim_array     IN mdsys.SDO_DIM_ARRAY,
                            measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION  set_pt_measure(point         IN OUT mdsys.SDO_GEOMETRY,
                            measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION set_pt_measure(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                           point         IN mdsys.SDO_GEOMETRY,
                           measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;




   FUNCTION set_pt_measure_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                              dim_array     IN mdsys.SDO_DIM_ARRAY,
                              point         IN mdsys.SDO_GEOMETRY,
                              pt_dim_array  IN mdsys.SDO_DIM_ARRAY,
                              measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION set_pt_measure_3d(geom_segment  IN OUT mdsys.SDO_GEOMETRY,
                              point         IN mdsys.SDO_GEOMETRY,
                              measure       IN NUMBER )
   RETURN VARCHAR2 PARALLEL_ENABLE;



   --
   -- reverse the direction of the geometry (shape pt order )
   --

   FUNCTION reverse_geometry(geom          IN mdsys.SDO_GEOMETRY,
                             dim_array     IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION reverse_geometry(geom          IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- generate an offset curve w.r.t. to an LRS geometry
   --

   -- for geodetic offset, consider arc_tolerance

   FUNCTION offset_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER,
                                offset        IN NUMBER,
                                unit          IN VARCHAR2)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   -- for geodetic offset, consider arc_tolerance

   FUNCTION offset_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER,
                                offset        IN NUMBER,
                                tolerance     IN NUMBER,
                                unit          IN VARCHAR2)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION offset_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER,
                                offset        IN NUMBER)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION offset_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER,
                                offset        IN NUMBER,
                                tolerance     IN NUMBER)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION offset_geom_segment(geom_segment  IN mdsys.SDO_GEOMETRY,
                                start_measure IN NUMBER,
                                end_measure   IN NUMBER,
                                offset        IN NUMBER)


   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION is_measure_increasing(geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY)


   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION is_measure_increasing(geom_segment  IN mdsys.SDO_GEOMETRY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_measure_increasing_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                     dim_array     IN mdsys.SDO_DIM_ARRAY)


   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION is_measure_increasing_3d(geom_segment  IN mdsys.SDO_GEOMETRY)

   RETURN VARCHAR2 PARALLEL_ENABLE;




   FUNCTION is_measure_decreasing(geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY)


   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_measure_decreasing(geom_segment  IN mdsys.SDO_GEOMETRY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_measure_decreasing_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                     dim_array     IN mdsys.SDO_DIM_ARRAY)


   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_measure_decreasing_3d(geom_segment  IN mdsys.SDO_GEOMETRY)

   RETURN VARCHAR2 PARALLEL_ENABLE;



   FUNCTION validate_lrs_geometry(geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION validate_lrs_geometry(geom_segment  IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION validate_lrs_geometry_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                     dim_array     IN mdsys.SDO_DIM_ARRAY)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION validate_lrs_geometry_3d(geom_segment  IN mdsys.SDO_GEOMETRY)
   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION find_lrs_dim_pos(table_name    IN VARCHAR2,
                             column_name   IN VARCHAR2)
   RETURN INTEGER PARALLEL_ENABLE;


   --
   -- get previous shape point based on the given measure
   --

   FUNCTION get_prev_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY,
                                  measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   --
   -- get previous shape point based on the given point
   --


   FUNCTION get_prev_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY,
                                  point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- get the next shape point based on the given measure
   --


   FUNCTION get_next_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION get_next_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY,
                                  measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION get_next_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  measure       IN NUMBER)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- get the next shape point based on  the given point
   --


   FUNCTION get_next_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               dim_array     IN mdsys.SDO_DIM_ARRAY,
                               point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt (geom_segment  IN mdsys.SDO_GEOMETRY,
                               point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  dim_array     IN mdsys.SDO_DIM_ARRAY,
                                  point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                  point         IN mdsys.SDO_GEOMETRY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;




   --
   -- get previous measure basd on the given measure
   --


   FUNCTION get_prev_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                      dim_array     IN mdsys.SDO_DIM_ARRAY,
                                      measure        IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_measure (geom_segment  IN mdsys.SDO_GEOMETRY,
                                       measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;




   FUNCTION get_prev_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                         dim_array     IN mdsys.SDO_DIM_ARRAY,
                                         measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_measure_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                          measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;




   --
   -- get previous measure (of shape point) based on the given point
   --


   FUNCTION get_prev_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                      dim_array     IN mdsys.SDO_DIM_ARRAY,
                                      point          IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                      point          IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;





   FUNCTION get_prev_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                         dim_array     IN mdsys.SDO_DIM_ARRAY,
                                         point        IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_prev_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                         point        IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;





   --
   -- get the next measure (of shape point) based on the given measure
   --


   FUNCTION get_next_shape_pt_measure (geom_segment  IN mdsys.SDO_GEOMETRY,
                                       dim_array     IN mdsys.SDO_DIM_ARRAY,
                                       measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION get_next_shape_pt_measure (geom_segment  IN mdsys.SDO_GEOMETRY,
                                       measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION get_next_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                      dim_array     IN mdsys.SDO_DIM_ARRAY,
                                      point           IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                      point           IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_measure_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                          dim_array     IN mdsys.SDO_DIM_ARRAY,
                                          measure       IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;


   FUNCTION get_next_shape_pt_measure_3d (geom_segment  IN mdsys.SDO_GEOMETRY,
                                          measure        IN NUMBER)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                         dim_array     IN mdsys.SDO_DIM_ARRAY,
                                         point        IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER PARALLEL_ENABLE;



   FUNCTION get_next_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                         point        IN mdsys.SDO_GEOMETRY)

   RETURN NUMBER;


   FUNCTION is_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                dim_array     IN mdsys.SDO_DIM_ARRAY,
                                measure       IN NUMBER)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_shape_pt_measure(geom_segment  IN mdsys.SDO_GEOMETRY,
                                measure       IN NUMBER)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                   dim_array     IN mdsys.SDO_DIM_ARRAY,
                                   measure       IN NUMBER)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   FUNCTION is_shape_pt_measure_3d(geom_segment  IN mdsys.SDO_GEOMETRY,
                                   measure       IN NUMBER)

   RETURN VARCHAR2 PARALLEL_ENABLE;


   --
   -- intersection for LRS geometries
   --

   FUNCTION lrs_intersection( geom_1 IN mdsys.SDO_GEOMETRY,
                              dim_array_1    IN mdsys.SDO_DIM_ARRAY,
                              geom_2 IN mdsys.SDO_GEOMETRY,
                              dim_array_2    IN mdsys.SDO_DIM_ARRAY)

   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


   FUNCTION lrs_intersection( geom_1 IN mdsys.SDO_GEOMETRY,
                              geom_2 IN mdsys.SDO_GEOMETRY,
                              tolerance      IN NUMBER)
   RETURN mdsys.SDO_GEOMETRY DETERMINISTIC PARALLEL_ENABLE;


END sdo_lrs;
/