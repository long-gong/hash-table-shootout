CXX=clang++
CXX_FLAGS=-O3 -march=native -std=c++14 -DNDEBUG
Qt5_CFLAGS := $(shell pkg-config --cflags Qt5Core)
Qt5_LDFLAGS := $(shell pkg-config --libs Qt5Core)
RM=rm -rf 

.PHONY: all clean pre_build benchmark html clean
.SECONDARY: main_build

all: pre_build main_build 

pre_build:
	@mkdir -p build 
	@echo Completed

main_build: build/std_unordered_map build/boost_unordered_map build/google_sparse_hash_map build/google_dense_hash_map build/google_dense_hash_map_mlf_0_9 build/qt_qhash build/spp_sparse_hash_map build/emilib_hash_map build/ska_flat_hash_map build/ska_flat_hash_map_power_of_two build/tsl_hopscotch_map build/tsl_hopscotch_map_mlf_0_5 build/tsl_hopscotch_map_store_hash build/tsl_robin_map build/tsl_robin_map_mlf_0_9 build/tsl_robin_map_store_hash build/tsl_robin_pg_map build/tsl_sparse_map build/tsl_ordered_map build/tsl_array_map build/tsl_array_map_mlf_1_0 build/folly_f14fastmap
	@echo Completed

output: main_build bench.py 
	python3 ./bench.py 

charts.html: output mark_chart_data.py make_html.py 
	python3 make_chart_data.py < output | python3 make_html.py 

benchmark: output 
	@echo Completed

html: charts.html 
	@echo Completed

build/std_unordered_map: src/std_unordered_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -o build/std_unordered_map src/std_unordered_map.cc

build/boost_unordered_map: src/boost_unordered_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -o build/boost_unordered_map src/boost_unordered_map.cc

build/google_sparse_hash_map: src/google_sparse_hash_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -o build/google_sparse_hash_map src/google_sparse_hash_map.cc

build/google_dense_hash_map: src/google_dense_hash_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -o build/google_dense_hash_map src/google_dense_hash_map.cc

build/google_dense_hash_map_mlf_0_9: src/google_dense_hash_map_mlf_0_9.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -o build/google_dense_hash_map_mlf_0_9 src/google_dense_hash_map_mlf_0_9.cc

build/qt_qhash: src/qt_qhash.cc src/template.c
	$(CXX) $(CXX_FLAGS) -lm -fPIC $(Qt5_CFLAGS) -o build/qt_qhash src/qt_qhash.cc $(Qt5_LDFLAGS)

build/spp_sparse_hash_map: src/spp_sparse_hash_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Isparsepp -o build/spp_sparse_hash_map src/spp_sparse_hash_map.cc

build/emilib_hash_map: src/emilib_hash_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Iemilib -o build/emilib_hash_map src/emilib_hash_map.cc

build/ska_flat_hash_map: src/ska_flat_hash_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Iflat_hash_map -o build/ska_flat_hash_map src/ska_flat_hash_map.cc

build/ska_flat_hash_map_power_of_two: src/ska_flat_hash_map_power_of_two.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Iflat_hash_map -o build/ska_flat_hash_map_power_of_two src/ska_flat_hash_map_power_of_two.cc



build/tsl_hopscotch_map: src/tsl_hopscotch_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Ihopscotch-map -o build/tsl_hopscotch_map src/tsl_hopscotch_map.cc

build/tsl_hopscotch_map_mlf_0_5: src/tsl_hopscotch_map_mlf_0_5.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Ihopscotch-map -o build/tsl_hopscotch_map_mlf_0_5 src/tsl_hopscotch_map_mlf_0_5.cc

build/tsl_hopscotch_map_store_hash: src/tsl_hopscotch_map_store_hash.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Ihopscotch-map -o build/tsl_hopscotch_map_store_hash src/tsl_hopscotch_map_store_hash.cc



build/tsl_robin_map: src/tsl_robin_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Irobin-map/include -o build/tsl_robin_map src/tsl_robin_map.cc

build/tsl_robin_map_mlf_0_9: src/tsl_robin_map_mlf_0_9.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Irobin-map/include -o build/tsl_robin_map_mlf_0_9 src/tsl_robin_map_mlf_0_9.cc

build/tsl_robin_map_store_hash: src/tsl_robin_map_store_hash.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Irobin-map/include -o build/tsl_robin_map_store_hash src/tsl_robin_map_store_hash.cc

build/tsl_robin_pg_map: src/tsl_robin_pg_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Irobin-map/include -o build/tsl_robin_pg_map src/tsl_robin_pg_map.cc


build/tsl_sparse_map: src/tsl_sparse_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Isparse-map/include -o build/tsl_sparse_map src/tsl_sparse_map.cc

build/tsl_ordered_map: src/tsl_ordered_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -Iordered-map/include -o build/tsl_ordered_map src/tsl_ordered_map.cc

# Array map need C++17 as it needs std::string_view for the hash part. Not part of the 'all' build
build/tsl_array_map: src/tsl_array_map.cc src/template.c
	$(CXX) $(CXX_FLAGS) -std=c++17 -Iarray-hash/include -o build/tsl_array_map src/tsl_array_map.cc

build/tsl_array_map_mlf_1_0: src/tsl_array_map_mlf_1_0.cc src/template.c
	$(CXX) $(CXX_FLAGS) -std=c++17 -Iarray-hash/include -o build/tsl_array_map_mlf_1_0 src/tsl_array_map_mlf_1_0.cc


build/folly_f14fastmap: src/folly_f14fastmap.cc src/template.c
	$(CXX) -O3 -std=c++14 -DNDEBUG -o $@  src/folly_f14fastmap.cc -lfolly -lglog -lgflags -lpthread  -ldouble-conversion -lboost_program_options -lboost_filesystem -lboost_system


clean:
	$(RM) build